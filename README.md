## Ant's Dotfiles

Personal dotfiles managed with [GNU Stow](https://www.gnu.org/software/stow/).

### Quick Start (macOS)

```bash
# Install everything + deploy dotfiles
./bootstrap-macos.sh
```

Or deploy manually:

```bash
brew install stow
cd ~/projects/antjanus/my-dotfiles
stow -t ~ common
```

### Quick Start (Linux)

```bash
sudo apt install stow
cd ~/projects/antjanus/my-dotfiles
stow -t ~ common linux
```

### Stow Packages

| Package | Contents | Platform |
|---------|----------|----------|
| `common/` | `.zshrc`, `.tmux.conf`, `.gitconfig`, `.fzf.zsh`, `.fzf.bash`, `.editorconfig`, `.inputrc`, `.curlrc`, `.psqlrc`, `.emacs` | All |
| `linux/` | `.config/i3/`, `.config/dunst/`, `.config/rofi/`, `.config/ranger/`, `.conkyrc`, `.i3status.conf` | Linux/i3 |

### Undeploy

```bash
stow -t ~ -D common       # remove common symlinks
stow -t ~ -D common linux  # remove all symlinks
```

### Managed Separately

These configs have their own git repos and are NOT in this dotfiles repo:

- `~/.config/nvim/` -- LazyVim setup
- `~/.config/kitty/` -- kitty terminal config
- [AstroNvim config](https://github.com/AntJanus/astronvim_config)

### Post-Install

1. Install tmux plugins: press `prefix + I` inside tmux
2. Install Node: `nvm install --lts`
3. Set up env files: create `~/.work-env` and `~/.personal-env` for API keys
4. Set up nvim: clone your nvim config to `~/.config/nvim/`
5. Set up kitty: clone your kitty config to `~/.config/kitty/`
