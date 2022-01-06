-------------------------------------------------
-- The Ultimate Volume Widget for Awesome Window Manager
-- https://github.com/streetturtle/awesome-wm-widgets/tree/master/volume-widget
-- @author Pavel Makhov
-- @copyright 2020 Pavel Makhov
-- FULLY MODIFIED VERSION BY @ITSNEXN
-------------------------------------------------

local awful = require("awful")
local wibox = require("wibox")
local spawn = require("awful.spawn")
local beautiful = require("beautiful")
local watch = require("awful.widget.watch")


local GET_VOLUME_CMD = 'amixer -D pulse sget Master'
local function INC_VOLUME_CMD(step) return 'amixer -D pulse sset Master ' .. step .. '%+' end
local function DEC_VOLUME_CMD(step) return 'amixer -D pulse sset Master ' .. step .. '%-' end
local TOG_VOLUME_CMD = 'amixer -D pulse sset Master toggle'

local volume = {}
local function worker(user_args)

    local args = user_args or {}

    local mixer_cmd = args.mixer_cmd or 'pavucontrol'
    local refresh_rate = args.refresh_rate or 1
    local step = args.step or 5
    local font = args.font or beautiful.font
    local fg = args.fg or beautiful.fg_normal

    volume.widget = wibox.widget({
        {
            {
                {
                    id = "icon",
                    -- resize = false,
                    font = beautiful.nerd_font .. " 18",
                    widget = wibox.widget.textbox,
                },
                valign = 'center',
                layout = wibox.container.place
            },
            {
                id = 'txt',
                font = font,
                widget = wibox.widget.textbox
            },
            layout = wibox.layout.fixed.horizontal,
        },
        fg = fg,
        widget = wibox.container.background,
        set_volume_level = function(self, new_value)
            self:get_children_by_id('txt')[1]:set_text(new_value .. "%")
            local volume_icon
            if self.is_muted then
                volume_icon = beautiful.icons.volume.muted
                self:get_children_by_id('txt')[1]:set_text(" Muted")
            else
                local new_value_num = tonumber(new_value)
                if new_value_num == 0 then
                    volume_icon = beautiful.icons.volume.muted
                    self:get_children_by_id('txt')[1]:set_text(" Muted")
                else
                    volume_icon = beautiful.icons.volume.default
                end
            end
            self:get_children_by_id('icon')[1]:set_text(volume_icon)
        end,
        mute = function(self)
            self.is_muted = true
        end,
        unmute = function(self)
            self.is_muted = false
        end
    })

    local function update_graphic(widget, stdout)
        local mute = string.match(stdout, "%[(o%D%D?)%]")   -- \[(o\D\D?)\] - [on] or [off]
        if mute == 'off' then widget:mute()
        elseif mute == 'on' then widget:unmute()
        end
        local volume_level = string.match(stdout, "(%d?%d?%d)%%") -- (\d?\d?\d)\%)
        volume_level = string.format("% 3d", volume_level)
        widget:set_volume_level(volume_level)
    end

    function volume:inc(s)
        spawn.easy_async(INC_VOLUME_CMD(s or step), function(stdout) update_graphic(volume.widget, stdout) end)
    end

    function volume:dec(s)
        spawn.easy_async(DEC_VOLUME_CMD(s or step), function(stdout) update_graphic(volume.widget, stdout) end)
    end

    function volume:toggle()
        spawn.easy_async(TOG_VOLUME_CMD, function(stdout) update_graphic(volume.widget, stdout) end)
    end

    function volume:mixer()
        if mixer_cmd then
            spawn.easy_async(mixer_cmd)
        end
    end

    volume.widget:buttons(
            awful.util.table.join(
                    awful.button({}, 4, function() volume:inc() end),
                    awful.button({}, 5, function() volume:dec() end),
                    awful.button({}, 1, function() volume:mixer() end), -- left click
                    awful.button({}, 3, function() volume:toggle() end) -- right click
            )
    )

    watch(GET_VOLUME_CMD, refresh_rate, update_graphic, volume.widget)

    return volume.widget
end

return setmetatable(volume, { __call = function(_, ...) return worker(...) end })
