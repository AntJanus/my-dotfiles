#!/usr/bin/env bash
#
# bootstrap.sh — Idempotent dotfile symlink installer.
#
# Walks each stow package directory (common/, plus linux/ on Linux), and for
# each tracked file creates a symlink at $HOME pointing back into the repo.
# Existing real files are backed up to dotfiles-backup-<timestamp>/ before
# the symlink is created. Existing correct symlinks are left alone.
#
# Usage:
#   ./bootstrap.sh                # apply
#   ./bootstrap.sh --dry-run      # show what would happen, change nothing
#   ./bootstrap.sh --help
#
# Notes:
#   - This script does NOT install Homebrew formulae or other packages. For the
#     full provisioning firehose on macOS, run ./bootstrap-macos.sh.
#   - This script is safe to re-run; only changed/missing links are touched.
#

set -euo pipefail

DRY_RUN=0

usage() {
  cat <<'USAGE'
bootstrap.sh — symlink dotfiles into $HOME

Options:
  --dry-run     Print actions without changing anything
  -h, --help    Show this help

Behavior:
  - macOS: deploys the `common/` package
  - Linux: deploys `common/` and `linux/` packages
  - Existing real files at the target are backed up to
    $HOME/dotfiles-backup-YYYYMMDD-HHMMSS/ preserving relative path
  - Existing correct symlinks are skipped
  - Existing wrong symlinks are reported and left alone (does not clobber)
USAGE
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --dry-run) DRY_RUN=1; shift ;;
    -h|--help) usage; exit 0 ;;
    *) echo "Unknown argument: $1" >&2; usage; exit 2 ;;
  esac
done

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_DIR="$HOME/dotfiles-backup-$(date +%Y%m%d-%H%M%S)"

case "$(uname -s)" in
  Darwin) PLATFORM="macos"; PACKAGES=(common) ;;
  Linux)  PLATFORM="linux"; PACKAGES=(common linux) ;;
  *)
    echo "Unsupported platform: $(uname -s)" >&2
    exit 1
    ;;
esac

linked_count=0
skipped_count=0
backed_up_count=0
conflict_count=0
backup_dir_created=0

log() { printf '%s\n' "$*"; }
dry_prefix() { [[ "$DRY_RUN" -eq 1 ]] && printf '[dry-run] ' || printf ''; }

ensure_backup_dir() {
  if [[ "$backup_dir_created" -eq 0 ]]; then
    if [[ "$DRY_RUN" -eq 0 ]]; then
      mkdir -p "$BACKUP_DIR"
    fi
    backup_dir_created=1
    log "$(dry_prefix)backup directory: $BACKUP_DIR"
  fi
}

# link_one <source-abs> <target-abs> <relpath-for-display>
link_one() {
  local source_path="$1"
  local target_path="$2"
  local rel_display="$3"

  if [[ -L "$target_path" ]]; then
    local current_target
    current_target="$(readlink "$target_path")"
    if [[ "$current_target" == "$source_path" ]]; then
      log "  skip      $rel_display (already linked)"
      skipped_count=$((skipped_count + 1))
      return 0
    else
      log "  conflict  $rel_display (symlink -> $current_target, want $source_path)"
      conflict_count=$((conflict_count + 1))
      return 0
    fi
  fi

  if [[ -e "$target_path" ]]; then
    ensure_backup_dir
    local backup_path="$BACKUP_DIR/$rel_display"
    log "  backup    $rel_display -> $backup_path"
    if [[ "$DRY_RUN" -eq 0 ]]; then
      mkdir -p "$(dirname "$backup_path")"
      mv "$target_path" "$backup_path"
    fi
    backed_up_count=$((backed_up_count + 1))
  fi

  log "  link      $rel_display -> $source_path"
  if [[ "$DRY_RUN" -eq 0 ]]; then
    mkdir -p "$(dirname "$target_path")"
    ln -s "$source_path" "$target_path"
  fi
  linked_count=$((linked_count + 1))
}

# walk_package <package-dir>
# Recursively walks files inside the stow package and links each one at
# $HOME with the same relative path. Directories are not symlinked
# wholesale; only individual files are. This matches stow's behavior of
# splaying the tree so $HOME/.config/foo can mix files from multiple
# sources.
walk_package() {
  local package="$1"
  local package_dir="$REPO_DIR/$package"

  if [[ ! -d "$package_dir" ]]; then
    log "package directory missing: $package_dir (skipping)"
    return 0
  fi

  log ""
  log "package: $package"

  # find prints paths relative to $package_dir (because we cd into it).
  # Strip the leading "./" portably (BSD sed has no -z).
  while IFS= read -r -d '' file_path; do
    local file_rel="${file_path#./}"
    local source_path="$package_dir/$file_rel"
    local target_path="$HOME/$file_rel"
    link_one "$source_path" "$target_path" "$file_rel"
  done < <(cd "$package_dir" && find . -type f -print0)
}

log "==========================================="
log "dotfiles bootstrap"
log "  platform: $PLATFORM"
log "  repo:     $REPO_DIR"
log "  packages: ${PACKAGES[*]}"
log "  mode:     $([[ $DRY_RUN -eq 1 ]] && echo dry-run || echo apply)"
log "==========================================="

for pkg in "${PACKAGES[@]}"; do
  walk_package "$pkg"
done

log ""
log "==========================================="
log "summary"
log "  linked:    $linked_count"
log "  skipped:   $skipped_count (already correct)"
log "  backed up: $backed_up_count"
log "  conflicts: $conflict_count (symlinks to other targets, not touched)"
if [[ "$backup_dir_created" -eq 1 ]]; then
  log "  backup at: $BACKUP_DIR"
fi
if [[ "$DRY_RUN" -eq 1 ]]; then
  log ""
  log "dry-run: no changes made. Re-run without --dry-run to apply."
fi
log "==========================================="
