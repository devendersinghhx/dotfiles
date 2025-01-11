# Enable Powerlevel11k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in Powerlevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::command-not-found

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q

# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Aliases
#alias ls='ls --color'
alias ls='eza --icons'
alias ll='ls -l'
alias la='ls -la'
alias c='clear'
alias pacman='sudo pacman'
alias tmux='tmux -u'
alias btop='btop --utf-force'
alias ff='fastfetch'
alias open='xdg-open'
alias xx='exit'
alias ai='tgpt'
alias vv='nvim .'
alias v='nvim'
alias hx='helix'
#alias yz='yazi'
alias zed='zeditor'

# Dirs
alias ..="cd .."
alias .2="cd ../.."
alias .3="cd ../../.."
alias .4="cd ../../../.."
alias .5="cd ../../../../.."

# Eza
alias l="eza -l --icons --git -a" 
alias lt="eza --tree --level=2 --long --icons --git"
alias ltree="eza --tree --level=2  --icons --git"
alias l.='eza -a | grep "^\." '

# System Update & Package Management
alias refresh='pacman -Syy'
alias update='pacman -Syu'
alias fullupdate='pacman -Syyu'
alias install='pacman -S'

# GIT Alias
alias gs='git status'
alias gsb='git status -sb'
alias ga='git add'
alias gal='git add -u'
alias gall='git add -A'
alias gl='git log'
alias gll='git log --oneline'


### ARCHIVE EXTRACTION
# usage: ex <file>
function ex {
  if [[ -z "$1" ]]; then
    # Display usage if no parameters are given
    echo "Usage: ex <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
    echo "       ex <path/file_name_1.ext> [path/file_name_2.ext] [path/file_name_3.ext]"
  else
    for n in "$@"
    do
      if [[ -f "$n" ]]; then
        case "${n%,}" in
          *.cbt|*.tar.bz2|*.tar.gz|*.tar.xz|*.tbz2|*.tgz|*.txz|*.tar)
                       tar xvf "$n"       ;;
          *.lzma)      unlzma "$n"        ;;
          *.bz2)       bunzip2 "$n"       ;;
          *.cbr|*.rar) unrar x -ad "$n"   ;;
          *.gz)        gunzip "$n"        ;;
          *.cbz|*.epub|*.zip) unzip "$n"  ;;
          *.z)         uncompress "$n"    ;;
          *.7z|*.arj|*.cab|*.cb7|*.chm|*.deb|*.dmg|*.iso|*.lzh|*.msi|*.pkg|*.rpm|*.udf|*.wim|*.xar)
                       7z x "$n"          ;;
          *.xz)        unxz "$n"          ;;
          *.exe)       cabextract "$n"    ;;
          *.cpio)      cpio -id < "$n"    ;;
          *.cba|*.ace) unace x "$n"       ;;
          *)
                       echo "ex: '$n' - unknown archive method"
                       return 1
                       ;;
        esac
      else
        echo "'$n' - file does not exist"
        return 1
      fi
    done
  fi
}


# Aliases for websites
alias aw='xdg-open https://wiki.archlinux.org/title/Main_page'

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# Source the Lazyman shell initialization for aliases and nvims selector
# shellcheck source=.config/nvim-Lazyman/.lazymanrc
[ -f ~/.config/nvim-Lazyman/.lazymanrc ] && source ~/.config/nvim-Lazyman/.lazymanrc
# Source the Lazyman .nvimsbind for nvims key binding
# shellcheck source=.config/nvim-Lazyman/.nvimsbind
[ -f ~/.config/nvim-Lazyman/.nvimsbind ] && source ~/.config/nvim-Lazyman/.nvimsbind

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Set the default editor
export EDITOR=nvim
export VISUAL=nvim

# Exports
export PATH="/usr/bin/lua51:$PATH"
export PATH="/usr/local/bin/luarocks:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# bun completions
[ -s "/home/devender/.bun/_bun" ] && source "/home/devender/.bun/_bun"

typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

# Yazi Quick Open
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# Startups
colorscript -e crunchbang-mini
#catnap
