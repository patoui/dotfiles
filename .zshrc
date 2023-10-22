export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

# Standard plugins can be found in $ZSH/plugins/
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Python
export PATH="/opt/homebrew/bin/python3:$PATH"

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Load aliases
source $HOME/.dotfiles/.zsh_aliases

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
