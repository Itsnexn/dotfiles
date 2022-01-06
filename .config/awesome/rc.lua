---@diagnostic disable: undefined-global
-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
require("modules.err_handler")

local gears = require("gears")
local awful = require("awful")
local beautiful = require("beautiful")
local cfg = require("config")
local utils = require("modules.utils")

_G.modkey = "Mod4" -- Check "xmodmap"

-- Initialize theme
beautiful.init(gears.filesystem.get_configuration_dir() .. "/themes/theme.lua")

-- Table of layouts to cover with awful.layout.inc, order matters.
awful.layout.layouts = {
    -- awful.layout.suit.tile.right,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.spiral.dwindle,
    awful.layout.suit.floating,
    awful.layout.suit.max
}

awful.screen.connect_for_each_screen(
    require("widgets.panel")
)

-- Key bindings
_G.clientkeys = require("keybindings.client")
_G.globalkeys = require("keybindings.global")

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
    _G.globalkeys =
        gears.table.join(
        globalkeys,
        -- awful.tag.history.restore,
        -- View tag only.
        awful.key({modkey}, "#" .. i + 9, function()
                local screen = awful.screen.focused()
                local tag = screen.tags[i]
                local last_tag = awful.tag.selected(1)

                if tag then
                    -- Checks if tag index that requested is equal to current tag index
                    if tag.index == last_tag.index then
                        awful.tag.history.restore() -- view previous tag
                        if not cfg.taglist.tags then
                            utils.update_tags()
                        end
                    else
                        tag:view_only()

                        if not cfg.taglist.tags then
                            utils.update_tags()
                        end
                    end
                end
            end,
            {description = "view tag #" .. i, group = "tag"}
        ),
        -- Toggle tag display.
        awful.key({modkey, "Control"}, "#" .. i + 9,
            function()
                local screen = awful.screen.focused()
                local tag = screen.tags[i]
                if tag then
                    awful.tag.viewtoggle(tag)
                    if not cfg.taglist.tags then
                        tag.name = cfg.taglist.tag_selected
                        utils.update_tags()
                    end
                end
            end,
            {description = "toggle tag #" .. i, group = "tag"}
        ),
        -- Move client to tag.
        awful.key({modkey, "Shift"}, "#" .. i + 9, function()
                if client.focus then
                    local tag = client.focus.screen.tags[i]
                    if tag then
                        client.focus:move_to_tag(tag)
                    end
                end
            end,
            {description = "move focused client to tag #" .. i, group = "tag"}
        )
    )
end

_G.clientbuttons =
    gears.table.join(
    awful.button({}, 1, function(c)
            c:emit_signal("request::activate", "mouse_click", {raise = true})
        end
    ),
    awful.button({modkey}, 1, function(c)
            c:emit_signal("request::activate", "mouse_click", {raise = true})
            awful.mouse.client.move(c)
        end
    ),
    awful.button({modkey}, 3, function(c)
            c:emit_signal("request::activate", "mouse_click", {raise = true})
            awful.mouse.client.resize(c)
        end
    )
)

-- Enable sloppy focus, so that focus follows mouse.
-- client.connect_signal("mouse::enter", function(c)
--     c:emit_signal("request::activate", "mouse_enter", {raise = false})
-- end)

-- Set keys
root.keys(globalkeys)

-- Rules
require("modules.rules")
require("modules.signals")
require("modules.notification")
require("modules.autostart")
