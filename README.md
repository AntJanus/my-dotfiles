# Ant's Dotfiles

Personal dotfiles for shell, editor, terminal multiplexer, and (on Linux) i3 window manager. Managed with [GNU Stow](https://www.gnu.org/software/stow/) layout, with a portable `bootstrap.sh` for symlink deployment that does not require stow.

This is a personal repo. No external contributions; feel free to fork.

## What's in here

| Path | Contents |
|---|---|
| `common/` | Cross-platform: `.zshrc`, `.tmux.conf`, `.gitconfig`, `.fzf.zsh`, `.fzf.bash`, `.editorconfig`, `.inputrc`, `.curlrc`, `.psqlrc`, `.emacs` |
| `linux/` | Linux/i3 only: `.config/i3/`, `.config/dunst/`, `.config/rofi/`, `.config/ranger/`, `.conkyrc`, `.i3status.conf` |
| `utils/power-menu/` | Linux i3 power menu helper (rofi + systemd) |
| `bootstrap.sh` | Cross-platform symlink installer (no package install) |
| `bootstrap-macos.sh` | macOS provisioning: Homebrew formulae + casks, oh-my-zsh, tpm, NVM, Rust, then `stow -t ~ common` |
| `docs/` | Audit and maintenance notes |

## Install

### Quick start (macOS, full provisioning)

```bash
./bootstrap-macos.sh
```

Installs Homebrew formulae and casks, oh-my-zsh, tpm, NVM, Rust, cargo/go/pipx tools, then deploys `common/` via stow.

### Quick start (any platform, symlinks only)

```bash
./bootstrap.sh --dry-run    # preview what would happen
./bootstrap.sh              # apply
```

`bootstrap.sh`:
- Detects macOS or Linux automatically.
- Symlinks `common/` files into `$HOME` (and `linux/` files too on Linux).
- Backs up existing real files to `$HOME/dotfiles-backup-YYYYMMDD-HHMMSS/` before linking.
- Skips files that are already correctly symlinked (idempotent).
- Reports conflicts (existing symlinks pointing somewhere else) without overwriting them.
- Does NOT install any system packages.

### Manual deploy via stow

If you have stow already and prefer it:

```bash
# macOS
brew install stow
stow -t ~ common

# Linux
sudo apt install stow
stow -t ~ common linux

# Undeploy
stow -t ~ -D common         # remove common symlinks
stow -t ~ -D common linux   # remove all symlinks
```

## What's intentionally NOT in this repo

- **API keys, tokens, or secrets.** This repo is public.
- **Machine-specific overrides.** `.zshrc` sources `~/.work-env`, `~/.personal-env`, and `~/.my_aliases` if present — keep machine/work-specific config in those files (uncommitted) on each machine.
- **Neovim config.** Lives at `~/.config/nvim/` with its own git repo (LazyVim setup).
- **Kitty terminal config.** Lives at `~/.config/kitty/` with its own git repo.
- **AstroNvim config.** Separate repo: <https://github.com/AntJanus/astronvim_config>

## Post-install

After running either bootstrap script:

1. Install tmux plugins: open tmux and press `prefix + I`.
2. Install Node: `nvm install --lts`.
3. Create `~/.work-env` and `~/.personal-env` for any API keys you need to source.
4. Clone your nvim config to `~/.config/nvim/`.
5. Clone your kitty config to `~/.config/kitty/`.

## Contributing

This is a personal config repo. No external contributions are accepted — fork it if you want to use any of it.
