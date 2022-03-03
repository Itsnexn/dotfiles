from libqtile.config import Key
from libqtile.command import lazy
from os import environ


mod = "mod4"
myTerminal = "kitty"

def termRun(cmd):
    global myTerminal
    return f"{myTerminal} {cmd}"


keys = [Key(key[0], key[1], *key[2:]) for key in [
    # =============================================
    #           -== Window Configs ==-
    # =============================================

    # Switch between windows in current stack pane
    ([mod], "j", lazy.layout.down()),
    ([mod], "k", lazy.layout.up()),
    ([mod], "h", lazy.layout.left()),
    ([mod], "l", lazy.layout.right()),

    # Arrow keys to switch between windows
    ([mod], "Left", lazy.layout.left()),
    ([mod], "Right", lazy.layout.right()),
    ([mod], "Up", lazy.layout.up()),
    ([mod], "Down", lazy.layout.down()),

    # Change window sizes (MonadTall)
    ([mod, "shift"], "l", lazy.layout.grow()),
    ([mod, "shift"], "h", lazy.layout.shrink()),

    # Toggle floating and full screen
    ([mod], "f", lazy.window.toggle_floating()),
    ([mod], "m", lazy.window.toggle_fullscreen()),
    # Move windows up or down in current stack
    ([mod, "shift"], "j", lazy.layout.shuffle_down()),
    ([mod, "shift"], "k", lazy.layout.shuffle_up()),

    # Toggle between different layouts as defined below
    ([mod], "Tab", lazy.next_layout()),
    ([mod, "shift"], "Tab", lazy.prev_layout()),

    # basicly alt+tab
    (["mod1"], "Tab", lazy.layout.next()),

    # Kill window
    ([mod], "w", lazy.window.kill()),

    # Switch focus of monitors
    ([mod], "period", lazy.next_screen()),
    ([mod], "comma", lazy.prev_screen()),

    # Restart Qtile
    ([mod, "control"], "r", lazy.restart()),
    ([mod, "control"], "q", lazy.shutdown()),

    # =============================================
    #           -== Useful things ==-
    # =============================================

    # Qtile logs
    ([mod, "control"], "l", lazy.spawn(termRun("tail -f  ~/.local/share/qtile/qtile.log"))),

    # Edit qtile config
    ([mod, "control"], "e", lazy.spawn(termRun("cd $HOME/.config/qtile && nvim ."))),

    # change language script
    ([mod], "space", lazy.spawn("bash " + environ["HOME"] + "/.config/qtile/language.sh")),

    # =============================================
    #             -== App Configs ==-
    # =============================================

    # Menu
    ([mod], "i", lazy.spawn("rofi -show drun")),

    # Window Nav
    ([mod, "shift"], "i", lazy.spawn("rofi -show")),

    # Rofi Emoji
    ([mod, "shift"], "o", lazy.spawn("rofi -show emoji")),

    # Cfg Editor Script
    ([mod], "o", lazy.spawn("bash -c '$HOME/.local/Scripts/cfgrofi'")),

    # Browser
    ([mod, "shift"], "b", lazy.spawn("firefox")),
    ([mod], "b", lazy.spawn("brave")),

    # File Explorer
    ([mod], "e", lazy.spawn(termRun("sleep 0.2;ranger"))),
    ([mod, "shift"], "e", lazy.spawn("nautilus")),

    # Terminal
    ([mod], "Return", lazy.spawn(myTerminal)),

    # Screenshot tools
    ([], "Print", lazy.spawn("flameshot gui")),
    (["shift"], "Print", lazy.spawn("flameshot screen -p ~/Pictures/screenshots")),

    # =============================================
    #          -== Hardware Configs ==-
    # =============================================

    # Volume
    ([], "XF86AudioLowerVolume", lazy.spawn(
        "amixer set Master 5%-"
    )),
    ([], "XF86AudioRaiseVolume", lazy.spawn(
        "amixer set Master 5%+"
    )),
    ([], "XF86AudioMute", lazy.spawn(
        "pactl set-sink-mute @DEFAULT_SINK@ toggle"
    )),

    # Brightness
    ([], "XF86MonBrightnessUp", lazy.spawn("brightnessctl set +10%")),
    ([], "XF86MonBrightnessDown", lazy.spawn("brightnessctl set 10%-")),
]]
