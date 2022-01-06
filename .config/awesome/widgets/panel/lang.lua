local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local naughty = require("naughty")

_G.LANG = "us"

local function lang_widget(user_args)
    local args = user_args or {}
    local font = args.font or beautiful.font
    local langs = args.langs or {"us"} -- index 1 is default map in the first

    local widget = wibox.widget {
        {
            id = "label",
            text = "N/A",
            font = font,
            widget = wibox.widget.textbox
        },
        layout = wibox.layout.fixed.horizontal
    }

    local label = widget:get_children_by_id("label")[1]

    label:set_text(string.upper(langs[1]))
    awful.spawn("setxkbmap " .. langs[1])

    local i = 1
    widget:connect_signal("button::press", function (_,_,_,button)
            -- Button 1 (Left Click) Lounch network_manager app
            if button == 1 then
                if langs[i+1] then
                    label:set_text(string.upper(langs[i+1]))
                    awful.spawn("setxkbmap " .. langs[i+1])
                    i = i + 1
                else
                    label:set_text(string.upper(langs[1]))
                    awful.spawn("setxkbmap " .. langs[1])
                    i = 1
                end
            end
        end
    )
    return widget
end

return lang_widget
