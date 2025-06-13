# ~/.config/zsh/zshrc.zsh

# Optional: define base path
ZSH_CONFIG="$HOME/.config/zsh"

# Source all modules
for file in "$ZSH_CONFIG/modules"/*.zsh; do
  source "$file"
done

