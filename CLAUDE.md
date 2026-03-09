# Dotfiles Repository

## Overview
Personal dotfiles for Antonin Januska. Cross-platform (macOS primary, Linux/i3 secondary). macOS uses Homebrew; Linux configs retained for i3/Ubuntu setups.

## Repository Structure (GNU Stow packages)
```
common/              # Stow package: cross-platform dotfiles
  .zshrc, .tmux.conf, .gitconfig, .fzf.zsh, .fzf.bash,
  .editorconfig, .inputrc, .curlrc, .psqlrc, .emacs
linux/               # Stow package: Linux/i3 only
  .config/i3/        # i3 window manager
  .config/dunst/     # notification daemon
  .config/rofi/      # application launcher
  .config/ranger/    # file manager
  .conkyrc, .i3status.conf
utils/               # Helper scripts (power menu)
bootstrap-macos.sh   # macOS bootstrap (Homebrew + stow deploy)
bootstrap.sh         # Ubuntu bootstrap (apt-based)
```

## Active Dotfiles (in `common/` stow package)
- `.zshrc` -- oh-my-zsh, bureau theme, bat/lsd/fd/fzf aliases, NVM, cargo
- `.tmux.conf` -- Dracula theme, vim keybindings, fzf session switcher, resurrect/continuum
- `.gitconfig` -- delta diff, LFS, color config
- `.fzf.zsh` / `.fzf.bash` -- fzf setup with modern `fzf --zsh`/`fzf --bash`
- `.editorconfig` -- UTF-8, tabs, LF line endings
- `.inputrc` -- readline config (case-insensitive completion, history search)
- `.curlrc` -- timeout and referer settings
- `.psqlrc` -- PostgreSQL prompt and output formatting

## Managed Separately (NOT in this repo)
- `~/.config/nvim/` -- LazyVim setup with `init.lua`, has its own git repo
- `~/.config/kitty/` -- kitty terminal config, has its own git repo
- AstroNvim config at https://github.com/AntJanus/astronvim_config

## Linux-Only (in `linux/` stow package)
- `.config/i3/` -- i3 window manager config
- `.config/dunst/` -- notification daemon
- `.config/rofi/` -- application launcher
- `.config/ranger/` -- file manager config
- `.conkyrc` -- system monitor widget
- `.i3status.conf` -- i3 status bar

## Legacy / Retired
- `.emacs` -- kept in `common/` for reference
- `bootstrap.sh` -- Ubuntu-only (`apt` commands), do NOT run on macOS

## Security
- **Never commit API keys or tokens** to this repo (it is public)
- Secrets go in `~/.work-env` and `~/.personal-env` (sourced via aliases, not auto-loaded)
- Personal aliases go in `~/.my_aliases` (not committed)
- The `.gitconfig` contains public email/name only

## Working with This Repo
- `bootstrap-macos.sh` -- installs all Homebrew formulae, casks, cargo/go/pipx tools, oh-my-zsh, tpm, NVM, Rust, then runs `stow -t ~ common`
- Deploy (macOS): `stow -t ~ common`
- Deploy (Linux): `stow -t ~ common linux`
- Undeploy: `stow -t ~ -D common`

## Git Workflow
- Single `main` branch, direct commits
- Conventional commits preferred
