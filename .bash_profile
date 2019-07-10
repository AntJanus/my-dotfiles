export LSCOLORS=GxFxCxDxBxegedabagaced
export EDITOR="nvim"

alias gpp="git pull; git push"
alias gp="git pull"
alias gpu="git push"
alias gs="git status"
alias ga="git add ."
alias gr="git reset --hard HEAD"

alias lmk="notify-send 'Something happened!'"
alias open="xdg-open &>/dev/null"

if [ -z $BASH_INIT ]; then
	export BASH_INIT=1
	source ~/.bashrc
fi

source ~/.bash_prompt


export PATH="$HOME/.cargo/bin:$PATH"
