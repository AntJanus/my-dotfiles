export LSCOLORS=GxFxCxDxBxegedabagaced

alias gpp="git pull; git push"
alias gp="git pull"
alias gpu="git push"
alias gs="git status"
alias ga="git add ."
alias gr="git reset --hard HEAD"
alias kts="tx ls | awk '{print $1}' | sed 's/://g' | xargs -I{} tmux kill-session -t {}"

if [ -z $BASH_INIT ]; then
	export BASH_INIT=1
	source ~/.bashrc
fi

source ~/.bash_prompt

