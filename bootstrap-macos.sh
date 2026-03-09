#!/usr/bin/env bash
set -euo pipefail

echo "=== macOS Bootstrap ==="
echo "Requires: Homebrew (https://brew.sh)"
echo ""

# Check for Homebrew
if ! command -v brew &> /dev/null; then
  echo "Homebrew not found. Install it first:"
  echo '  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"'
  exit 1
fi

echo "Installing Homebrew formulae..."
brew install \
  bat \
  bottom \
  btop \
  csvlens \
  fd \
  figlet \
  fzf \
  gh \
  git-delta \
  git-lfs \
  gitui \
  go \
  htop \
  imagemagick \
  just \
  lazygit \
  lsd \
  midnight-commander \
  mpv \
  ncdu \
  neovim \
  ollama \
  pandoc \
  pipx \
  ranger \
  stow \
  tmux \
  vhs \
  wget \
  zoxide \
  zsh-syntax-highlighting

echo ""
echo "Installing Homebrew casks..."
brew install --cask \
  ghostty \
  google-chrome

echo ""
echo "Installing oh-my-zsh..."
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
  echo "  oh-my-zsh already installed, skipping."
fi

echo ""
echo "Installing zsh-syntax-highlighting plugin for oh-my-zsh..."
ZSH_SYNTAX_DIR="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"
if [ ! -d "$ZSH_SYNTAX_DIR" ]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_SYNTAX_DIR"
else
  echo "  zsh-syntax-highlighting already installed, skipping."
fi

echo ""
echo "Installing tmux plugin manager (tpm)..."
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
  git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
else
  echo "  tpm already installed, skipping."
fi

echo ""
echo "Installing NVM..."
if [ ! -d "$HOME/.nvm" ]; then
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
else
  echo "  NVM already installed, skipping."
fi

echo ""
echo "Installing Rust..."
if ! command -v rustc &> /dev/null; then
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
else
  echo "  Rust already installed ($(rustc --version)), skipping."
fi

echo ""
echo "Installing cargo packages..."
if command -v cargo &> /dev/null; then
  cargo install oxker
else
  echo "  cargo not found, skipping cargo packages."
fi

echo ""
echo "Installing Go tools..."
if command -v go &> /dev/null; then
  go install github.com/maaslalani/asciigraph/cmd/asciigraph@latest
  go install github.com/mermaid-js/mermaid-ascii/cmd/mermaid-ascii@latest
else
  echo "  go not found, skipping Go tools."
fi

echo ""
echo "Installing pipx packages..."
if command -v pipx &> /dev/null; then
  pipx install shot-scraper
  pipx install termgraph
else
  echo "  pipx not found, skipping pipx packages."
fi

echo ""
echo "Deploying dotfiles with stow..."
stow -t ~ common

echo ""
echo "=== Post-install steps ==="
echo "1. Install tmux plugins: press prefix + I inside tmux"
echo "2. Install Node:   nvm install --lts"
echo "3. Set up env files: create ~/.work-env and ~/.personal-env for API keys"
echo "4. Set up nvim: clone your nvim config to ~/.config/nvim/"
echo "5. Set up kitty: clone your kitty config to ~/.config/kitty/"
