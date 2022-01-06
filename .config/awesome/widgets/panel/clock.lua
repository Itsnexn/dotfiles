local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi


local clock_widget = function (user_args)
    local args = user_args or {}
    local fg = args.fg or beautiful.fg_normal
    local font = args.font or beautiful.font

	local widget = wibox.widget{
            {
                {
                    {
                        text = "",
                        font = beautiful.nerd_font .. " 18",
                        widget = wibox.widget.textbox
                    },
                    {
                        widget = wibox.widget.textclock(" %a %B %d - %H:%M"),
                        font = font,
                    },
                    layout = wibox.layout.fixed.horizontal,
                },

                widget = wibox.container.background,
                fg = fg,
            },
            widget = wibox.container.margin,
            top = dpi(1),
        }

	return widget
end


return clock_widget
