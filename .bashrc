NPM_TOKEN=""

if [ -z $BASH_INIT ]; then
	export BASH_INIT=1
 	[ -n "$PS1" ] && source ~/.bash_profile;
fi

export NPM_TOKEN=$NPM_TOKEN
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval "$(direnv hook bash)"

