from libqtile import layout
from libqtile.config import Match
from .theme import colors


# Layouts and layout rules

layout_conf = {
    "border_focus": colors["focus"][0],
    "border_width": 2,
    "margin": 8,
    "border-radius": 9
}

layouts = [
    layout.MonadTall(**layout_conf),
    layout.MonadWide(**layout_conf),
    # layout.Max(),
    # layout.Matrix(columns=2, **layout_conf),
    layout.RatioTile(**layout_conf),

    # layout.Bsp(**layout_conf),
    # layout.Columns(),
    # layout.Tile(),
    # layout.TreeTab(**layout_conf,
        # font="UbuntuMono Nerd Font",
        # bg_color=colors["dark"],
        # active_bg=colors["focus"],
        # active_fg=colors["active"],
        # inactive_bg=colors["inactive"],
        # inactive_fg="#dddddd",
        # ),
    # layout.VerticalTile(),
    # layout.Zoomy(**layout_conf, columnwidth=100,),
]

floating_layout = layout.Floating(
    float_rules=[
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),
        Match(wm_class="makebranch"),
        Match(wm_class="maketag"),
        Match(wm_class="ssh-askpass"),
        Match(title="branchdialog"),
        Match(title="pinentry"),
    ],
    border_focus=colors["color4"][0]
)
