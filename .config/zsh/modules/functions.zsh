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


# Yazi Quick Open
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}



# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/devnix/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/devnix/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/devnix/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/devnix/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


