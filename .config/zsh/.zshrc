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

VI_MODE=0

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

if [[ $VI_MODE -gt 0 ]]; then
    plugins+=(
        # git clone https://github.com/jeffreytse/zsh-vi-mode $ZSH/custom/plugins/zsh-vi-mode
        zsh-vi-mode
    )
    bindkey -v
    export KEYTIMEOUT=1
    ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT
    ZVM_VI_HIGHLIGHT_BACKGROUND=#3d59a1

    # Change cursor shape for different vi modes.
    function zle-keymap-select {
      if [[ ${KEYMAP} == vicmd ]] ||
         [[ $1 = 'block' ]]; then
        echo -ne '\e[1 q'
      elif [[ ${KEYMAP} == main ]] ||
           [[ ${KEYMAP} == viins ]] ||
           [[ ${KEYMAP} = '' ]] ||
           [[ $1 = 'beam' ]]; then
        echo -ne '\e[5 q'
      fi
    }

    zle -N zle-keymap-select
    zle-line-init() {
        zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
        echo -ne "\e[5 q"
    }

    zle -N zle-line-init
    echo -ne '\e[5 q' # Use beam shape cursor on startup.
    preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.
fi

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
