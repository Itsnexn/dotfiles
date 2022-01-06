#!/bin/bash
# nitrogen wallpaper
nitrogen --restore &

# To set opacity for windows
picom -b -f &

# notification server
dunst &

# auth agent

# NetworkManager systray icon 
nm-applet &

# Volume tray icon
volumeicon &

# Bluetooth tray icon
blueman-tray &

# hide cursor when typing
xbanish &

# manager usb and cd's
udiskie &

# Disable the f***ing beep sound
xset b off

# polkit (auth agent)
lxpolkit &

# Enable num pads
setleds -D +num
