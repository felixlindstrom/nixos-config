eval "$(starship init zsh)"

source "${HOME}/.config/zsh/aliases.zsh"
source "${HOME}/.config/zsh/config.zsh"
source "${HOME}/.config/zsh/history.zsh"
source "${HOME}/.config/zsh/paths.zsh"
source "${HOME}/.config/zsh/paths.zsh"
source "${HOME}/.config/zsh/fzf.zsh"

bindkey -v
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'
