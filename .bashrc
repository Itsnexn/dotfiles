# ~/.bashrc
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

# Source configs
for f in ~/.config/shellrc/*; do source "$f"; done

# Start starship prompt
eval "$(starship init bash)"
