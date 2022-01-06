from libqtile import widget, qtile
from .theme import colors
# Get the icons at https://www.nerdfonts.com/cheat-sheet (you need a Nerd Font)
from .keys import termRun


def base(fg="text", bg="dark"):
    return {
        "foreground": colors[fg],
        "background": colors[bg]
    }


def separator():
    return widget.Sep(**base(), linewidth=0, padding=10)


def txt(fg="text", bg="dark", fontsize=16, text="?", mouse_callbacks={}):
    return widget.TextBox(
        **base(fg, bg),
        fontsize=fontsize,
        text=text,
        padding=3,
        mouse_callbacks=mouse_callbacks
    )


def powerline(fg="light", bg="dark"):
    return widget.TextBox(
        **base(fg, bg),
        text="",
        # text="",
        fontsize=37,
        padding=-2
    )


def workspaces():
    return [
        # separator(), # just using when rounded corner is set
        widget.GroupBox(
            **base(fg="light"),
            font="UbuntuMono Nerd Font",
            fontsize=19,
            margin_y=3,
            margin_x=0,
            padding_y=8,
            borderwidth=2,
            active=colors["active"],
            inactive=colors["inactive"],
            highlight_method="line",
            highlight_color=colors["dark"],
            urgent_alert_method="block",
            urgent_border=colors["urgent"],
            this_current_screen_border=colors["focus"],
            this_screen_border=colors["grey"],
            other_current_screen_border=colors["dark"],
            other_screen_border=colors["dark"],
            rounded=False,
            disable_drag=True,
            use_mouse_wheel=True,
        ),
        separator(),
        widget.WindowName(
            **base(fg="focus"),
            fontsize=16,
            padding=5
        ),
        separator(),
    ]


primary_widgets = [
    *workspaces(),
    separator(),

    # powerline("color4", "dark"),

    powerline("color3"),

    # Show system try icons
    widget.Systray(**base(bg="color3")),
    txt(bg="color3", text=" ",),

    powerline("color2", "color3"),

    # battery status
    widget.Battery(
        battery=0,
        format="{char} {percent:0.1%}",
        update_interval=5,
        low_percentage=0.1,
        full_char="",
        discharge_char="",
        empty_char="",
        unknown_char="",
        charge_char="",
        **base(bg="color2")
    ),

    # just a seprator
    txt(bg="color2", text="|",),

    # Wlan SSID
    txt(
        bg="color2",
        text=" ",
        mouse_callbacks={
            'Button1': lambda: qtile.cmd_spawn("nmcli-rofi"),
        },
    ),
    widget.Wlan(
        disconnected_message="Disconnect",
        format="{essid}",
        interface="wlp3s0",
        mouse_callbacks={
            'Button1': lambda: qtile.cmd_spawn("nmcli-rofi"),
        },
        **base(bg="color2"
               )),

    # just a seprator
    txt(bg="color2", text="|"),

    # Volume widget
    txt(
        bg="color2",
        text="Vol:",
        mouse_callbacks={
            'Button1': lambda: qtile.cmd_spawn(termRun("pulsemixer")), }
    ),
    widget.Volume(
        mouse_callbacks={
            'Button1': lambda: qtile.cmd_spawn(termRun("pulsemixer")), },
        **base(fg="dark", bg="color2")
    ),

    powerline("color1", "color2"),

    # Keyboard layout
    widget.KeyboardLayout(**base(bg="color1"), configured_keyboards=[
                          "us", "ir"], display_map={"US": "us", "FA": "ir"}),

    # just a seprator
    txt(bg="color1", text=" | "),

    # Date
    widget.Clock(**base(bg="color1"), format="%d %B %Y"),

    # just a seprator
    txt(bg="color1", text=" | "),

    # Clock
    widget.Clock(**base(bg="color1"), format="%H:%M:%S "),

    powerline("dark", "color1"),

    # Show current layout
    widget.CurrentLayoutIcon(**base(bg="dark"), scale=0.65),
    widget.CurrentLayout(**base(bg="dark", fg="light"), padding=5),
    separator(),
]

secondary_widgets = [
    *workspaces(),

    separator(),

    powerline("color1", "dark"),

    widget.CurrentLayoutIcon(**base(bg="color1"), scale=0.65),

    widget.CurrentLayout(**base(bg="color1"), padding=5),

    powerline("color2", "color1"),

    widget.Clock(**base(bg="color2"), format="%d/%m/%Y - %H:%M "),

    powerline("dark", "color2"), ]
widget_defaults = {
    "font": "UbuntuMono Nerd Font Bold",
    "fontsize": 14,
    "padding": 5,
}
extension_defaults = widget_defaults.copy(),
