export LSCOLORS=GxFxCxDxBxegedabagaced

alias gpp="git pull; git push"
alias gp="git pull"
alias gpu="git push"
alias gs="git status"
alias ga="git add ."
alias gr="git reset --hard HEAD"
alias kts="tx ls | awk '{print $1}' | sed 's/://g' | xargs -I{} tmux kill-session -t {}"

alias bex="bundle exec"

source ~/.bash_prompt
