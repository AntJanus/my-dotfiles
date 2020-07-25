# Setup fzf
# ---------
if [[ ! "$PATH" == */home/$(whoami)/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/$(whoami)/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/$(whoami)/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/$(whoami)/.fzf/shell/key-bindings.bash"
