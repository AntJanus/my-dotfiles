## Ant's Dotfiles

To properly make this all work, you need to install a bunch of tools!

1. Node + NVM
2. zsh and oh-my-zsh
3. neovim
4. rofi (dmenu replacement)
5. lsd (ls substitute)
6. bat (cat substitute)
7. slapmoji (emojis)
8. ranger (file manager)
9. conky
10. [fd (find replacement, works with fzf)](https://github.com/sharkdp/fd)
11. [fzf (fuzzy finder)](https://github.com/junegunn/fzf)
12. [ripgrep (fast grep replacement)](https://github.com/burntsushi/ripgrep)
13. ag - silversearcher
14. Archey or screenfetch (displays info about current OS/system)
15. autorandr (saves/switches monitor setup)

NPM packages to install:

```sh
npm install -g \
	commitizen \
	cz-conventional-changelog
```

### NeoVIM

Resources:

- [Plug](https://github.com/junegunn/vim-plug)

To install:

```
sudo apt install neovim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

Install plugins:

```
nvim
:PlugInstall
:checkhealth
:UpdateRemotePlugins
```

Usual suspects:

```
npm install -g neovim
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


