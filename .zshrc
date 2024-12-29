# Add deno completions to search path
if [[ ":$FPATH:" != *":/Users/patoui/.zsh/completions:"* ]]; then export FPATH="/Users/patoui/.zsh/completions:$FPATH"; fi
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

# Onyx config
export ONYX_PATH="/Users/patoui/.onyx"
export PATH="$ONYX_PATH/bin:$PATH"

# PHP
export PATH="$PATH:$HOME/.composer/vendor/bin"

# Java
# export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-11.jdk/Contents/Home
export JAVA_HOME=/Library/Java/JavaVirtualMachines/liberica-jdk-17.jdk/Contents/Home


# Android
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Go
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

# Aseprite
export PATH=$PATH:/Applications/Aseprite.app/Contents/MacOS
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

# Compiler
export LDFLAGS="-L/opt/homebrew/opt/libiconv/lib -L/opt/homebrew/opt/openssl@3/lib -L/opt/homebrew/opt/pcre2/lib"
export CPPFLAGS="-I/opt/homebrew/opt/libiconv/include -I/opt/homebrew/opt/openssl@3/include -I/opt/homebrew/opt/pcre2/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/openssl@3/lib/pkgconfig:/opt/homebrew/opt/pcre2/lib/pkgconfig"
export PATH="/opt/homebrew/opt/libiconv/bin:$PATH"
export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"

# PostgreSQL
export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"

# bun completions
[ -s "/Users/patoui/.bun/_bun" ] && source "/Users/patoui/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"


autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/terraform terraform
. "/Users/patoui/.deno/env"
# Initialize zsh completions (added by deno install script)
autoload -Uz compinit
compinit