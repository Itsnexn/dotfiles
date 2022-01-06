local wibox = require("wibox")
local beautiful = require("beautiful")
local cfg = require("config")
local utils = require("modules.utils")
local awful = require("awful")
-- local dpi = beautiful.xresources.apply_dpi


return function(s)
    -- Create the wibor
    s.mywibox =
        awful.wibar({
            position = beautiful.wibar_position,
            screen = s,
            height = beautiful.wibar_height,
            bg = beautiful.wibar_bg,
        }
    )
    -- Add widgets to the wibox
    s.mywibox:setup {
        {
            layout = wibox.layout.align.horizontal,
            {
                -- Left widgets
                layout = wibox.layout.fixed.horizontal,
                require("widgets.panel.taglist")(s),
                {
                    valign = "center",
                    halign = "center",
                    layout = wibox.container.place
                },
                require("widgets.panel.icon-only-tasklist")(s),
            },
            nil,
            {
                -- Right widgets
                layout = wibox.layout.fixed.horizontal,

                require("widgets.panel.systray")(),

                utils.separator(0, require("widgets.panel.lang")({
                            font = beautiful.font_mono .. beautiful.font_size_normal,
                            langs = {"us", "ir"}
                        }
                )),

                -- require("widgets.panel.fs-widget")(),

                -- utils.separator(0, require("widgets.panel.software-update")({
                --         font = beautiful.font_mono .. beautiful.font_size_normal,
                -- }), beautiful.blue),

                utils.separator(1, require("widgets.panel.network")({
                            font = beautiful.font_mono .. beautiful.font_size_normal,
                            show_label = true,
                            fg_connected = beautiful.green,
                            fg_offline = beautiful.red
                        }
                    ),
                    beautiful.active
                ),

                utils.separator(1, require("widgets.panel.brightness")({
                            font = beautiful.font_mono .. beautiful.font_size_normal,
                            path_to_icon = beautiful.icon_brightness,
                            fg = beautiful.purple,
                        }
                    ),
                    beautiful.active
                ),

                utils.separator(1, require("widgets.panel.volume")({
                            font = beautiful.font_mono .. beautiful.font_size_normal,
                            warning_msg_icon = beautiful.icon_spaceman,
                            show_level = false,
                            fg = beautiful.blue
                        }
                    ),
                    beautiful.active
                ),

                utils.separator(1, require("widgets.panel.battery")({
                            font = beautiful.font_mono .. beautiful.font_size_normal,
                            warning_msg_icon = beautiful.icon_spaceman,
                            fg = beautiful.yellow,
                        }
                    ),
                    beautiful.active
                ),

                utils.separator(1, require("widgets.panel.layoutbox")(s), beautiful.active , 0),

                wibox.widget.separator({
                    thickness = 0,
                    forced_width = 5,
                }),

            }
        },
        { -- Center
            utils.separator(0, require("widgets.panel.clock")(
                    {
                        font = beautiful.font_mono .. beautiful.font_size_normal,
                        fg = beautiful.fg_normal
                    }
                ),
                beautiful.red
            ),

            content_fill_vertical = true,
            valign = "center",
            halign = "center",
            layout = wibox.container.place
        },
        layout = wibox.layout.stack,
        bg = beautiful.bg
    }
end
