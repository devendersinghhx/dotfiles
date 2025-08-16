# System Update & Package Management
alias refresh='pacman -Syy'
alias update='pacman -Syu'
alias fullupdate='pacman -Syyu'
alias install='pacman -S'

# Dirs
alias ..="cd .."
alias .2="cd ../.."
alias .3="cd ../../.."
alias .4="cd ../../../.."
alias .5="cd ../../../../.."

# Eza
alias l="eza -lh --icons --git -a"
alias lt="eza --tree --level=2 --long --icons --git"
alias ltree="eza --tree --level=2  --icons --git"
alias l.='eza -a | grep "^\." '

# Aliases
#alias ls='ls --color'
alias ls='eza --icons'
alias ll='ls -l'
alias la='ls -la'
alias c='clear'
alias pacman='sudo pacman'
alias tmux='tmux -u'
alias btop='btop --force-utf'
alias ff='fastfetch'
alias open='xdg-open'
alias xx='exit'
alias ai='tgpt'
alias vv='nvim .'
alias v='nvim'
alias hx='helix'
alias zed='zeditor'

# HyprPanel Alias
alias hps='hyprpanel toggleWindow settings-dialog'
alias tbar='hyprpanel toggleWindow bar-0'
