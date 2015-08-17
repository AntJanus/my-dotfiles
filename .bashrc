export NVM_DIR="/home/user/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

source ~/.nvm/nvm.sh

if [ -d "$HOME/.local/bin" ]; then
    PATH="$HOME/.local/bin:$PATH"
fi

[ -n "$PS1" ] && source ~/.bash_profile;
