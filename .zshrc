#Source custom Zsh config if it exists
[[ -f "$HOME/.config/zsh/zshrc.zsh" ]] && source "$HOME/.config/zsh/zshrc.zsh"

# Startups
# colorscript -e crunchbang-mini
# pfetch

nitch

export CRYPTOGRAPHY_OPENSSL_NO_LEGACY=1

[ -f /opt/miniconda3/etc/profile.d/conda.sh ] && source /opt/miniconda3/etc/profile.d/conda.sh

