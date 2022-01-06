local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")
local cfg = require("config")
local dpi = beautiful.xresources.apply_dpi
local clickable_container = require("widgets.clickable-container")
local update_tags = require("modules.utils").update_tags

local taglist = function(s)
    local taglist_buttons =
        gears.table.join(awful.button({}, 1, function(t)
                t:view_only()
                if not cfg.taglist.tags then
                    update_tags()
                end
            end
        ),
        awful.button({}, 3, function(t)
                awful.tag.viewtoggle(t)
                if not cfg.taglist.tags then
                    update_tags()
                end
            end
        ),
        awful.button({}, 4, function(t)
                awful.tag.viewnext(t.screen)
            end
        ),
        awful.button({},5,function(t)
                awful.tag.viewprev(t.screen)
            end
        )
    )

    -- Each screen has its own tag table.
    if cfg.taglist.tags then
        _G.tag_names = cfg.taglist.tags
    elseif cfg.taglist.tag_default and cfg.taglist.tag_selected then
        local tag = cfg.taglist.tag_default
        _G.tag_names = {tag, tag, tag, tag, tag, tag, tag, tag, tag}
        tag_names[1] = cfg.taglist.tag_selected
    else
        _G.tag_names = {" 1 ", " 2 ", " 3 ", " 4 ", " 5 ", " 6 ", " 7 ", " 8 ", " 9 "}
    end

    for idx, name in ipairs(tag_names) do
        local selected = false
        if idx == 1 then
            selected = true
        end

        awful.tag.add(
            name,
            {
                screen = s,
                layout = awful.layout.suit.tile,
                selected = selected
            }
        )
    end

    local tags =
        awful.widget.taglist {
        screen = s,
        filter = awful.widget.taglist.filter.all,
        buttons = taglist_buttons
    }

    return wibox.widget {
        {
            tags,
            border_width = dpi(0),
            -- border_color = beautiful.bg_normal_alt,
            -- bg = beautiful.bg_button_normal,
            -- shape = gears.shape.rounded_bar,
            widget = wibox.container.background
        },
        -- margins = {top = dpi(0), bottom = dpi(0)},
        widget = clickable_container
    }
end

return taglist
