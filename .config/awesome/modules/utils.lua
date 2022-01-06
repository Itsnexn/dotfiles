local awful = require("awful")
local cfg = require("config")
local beautiful = require("beautiful")
local gears = require("gears")
local dpi = beautiful.xresources.apply_dpi
local wibox = require("wibox")

local utils = {}

function utils.update_tags()
    local tags = awful.screen.focused().tags
    for _, t in pairs(tags) do
        if not t.selected then
            t.name = cfg.taglist.tag_default
        elseif t.selected then
            t.name = cfg.taglist.tag_selected
        end
    end
end

function utils.separator(mode, widget, color, rsep, lsep, shape)
    lsep = lsep or beautiful.widget_sep
    rsep = rsep or beautiful.widget_sep
    color = color or beautiful.wibar_bg
    shape = shape or gears.shape.rectangle
    mode = mode or 0
    if mode == 0 then
        return {
                    {
                        {
                            widget,
                            left= dpi(5),
                            right= dpi(5),
                            widget = wibox.container.margin,
                        },
                        bottom = dpi(3),
                        color = color,
                        -- shape = gears.shape.rounded_rect,
                        widget = wibox.container.margin,
                    },
                    left = lsep,
                    right = rsep,
                    widget = wibox.container.margin
                }
    elseif mode == 1 then
        return {
                    {
                        {
                            {
                                widget,
                                left = dpi(6),
                                right = dpi(6),
                                widget = wibox.container.margin,
                            },
                            bg = color .. "a0",
                            shape = shape,
                            widget = wibox.container.background
                        },
                        bottom = dpi(4),
                        top = dpi(4),
                        widget = wibox.container.margin,
                    },
                    left = lsep,
                    right = rsep,
                    widget = wibox.container.margin
                }
    end
end


return utils
