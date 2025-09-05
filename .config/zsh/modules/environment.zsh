# Set default editor
export EDITOR=nvim
export VISUAL=nvim

# Exports
export PATH="/usr/bin/lua51:$PATH"
export PATH="/usr/local/bin/luarocks:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
