# ███╗   ██╗███████╗██╗  ██╗███╗   ██╗
# ████╗  ██║██╔════╝╚██╗██╔╝████╗  ██║
# ██╔██╗ ██║█████╗   ╚███╔╝ ██╔██╗ ██║
# ██║╚██╗██║██╔══╝   ██╔██╗ ██║╚██╗██║
# ██║ ╚████║███████╗██╔╝ ██╗██║ ╚████║
# ╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═══╝
#
# Twitter : https://twitter.com/itsnexn
# Github  : https://github.com/Itsnexn
# Website : Itsnexn.me
#
# MIT License

# Oh My Zsh ======================================
export ZSH="$XDG_CONFIG_HOME/ohmyzsh"
ZSH_THEME="robbyrussell"

# Plugins
plugins=(
    git
    extract
    pip
    virtualenv
    archlinux

    # git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    zsh-autosuggestions
    # git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    zsh-syntax-highlighting
)

autoload -U compinit && compinit
source $ZSH/oh-my-zsh.sh

# Other configuration ============================

# Custom command not found handler
command_not_found_handler () {
  cat >&2 << EOF
$(tput setaf 1)$(tput bold)$1$(tput sgr0) command not found!
EOF
  return 127
}

# Source configs
for f in ~/.config/shellrc/*; do source "$f"; done

# ENV file
[[ -e $HOME/.config/env ]] && source $HOME/.config/env

# Start starship prompt
eval "$(starship init zsh)"
