## Ant's Dotfiles

To properly make this all work, you need to install a bunch of tools!

1. Node + NVM
2. zsh and oh-my-zsh
3. tmux
4. [asdf](https://asdf-vm.com/guide/getting-started.html)
5. [neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim)
7. [lsd (ls substitute)](https://github.com/lsd-rs/lsd)
8. [bat (cat substitute)](https://github.com/sharkdp/bat)
9. slapmoji (emojis)
10. ranger (file manager)
11. [fd (find replacement, works with fzf)](https://github.com/sharkdp/fd)
12. [fzf (fuzzy finder)](https://github.com/junegunn/fzf)
13. [ripgrep (fast grep replacement)](https://github.com/burntsushi/ripgrep)
14. ag - silversearcher

**Ubuntu only:**

1. Archey or screenfetch (displays info about current OS/system)
2. autorandr (saves/switches monitor setup)
3. rofi (dmenu replacement)
4.  conky

**MacOS only:**

1. Homebrew

**NPM packages**

```sh
npm install -g \
eslint \
lint-cli \
neovim \
np \
npm-check-updates \
prettier \
typescript
```

### NeoVIM

Resources:

- [neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim)

To install on Ubuntu:

```sh
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt install neovim
```

To install on MacOS (with homebrew):

```sh
brew install neovim
```


### FZF

```
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```

### Fd

```bash
sudo apt install fd-find
```

### ZSH Syntax Highlighting

https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md#oh-my-zsh

```sh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```


