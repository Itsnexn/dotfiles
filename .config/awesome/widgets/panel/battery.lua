-------------------------------------------------
-- Battery Widget for Awesome Window Manager
-- https://github.com/streetturtle/awesome-wm-widgets/tree/master/battery-widget
-- @author Pavel Makhov
-- @copyright 2017 Pavel Makhov
-- FULLY MODIFIED VERSION BY @ITSNEXN
-------------------------------------------------

local awful = require("awful")
local naughty = require("naughty")
local watch = require("awful.widget.watch")
local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi

local function module(user_args)
    local args = user_args or {}
    local font = args.font or beautiful.font
    local warning_msg_title = args.warning_msg_title or "Huston, we have a problem"
    local warning_msg_text = args.warning_msg_text or "Battery is dying"
    local warning_msg_icon = args.warning_msg_icon or nil
    local enable_battery_warning = args.enable_battery_warning
    local fg = args.fg or beautiful.fg_normal

    if enable_battery_warning == nil then
        enable_battery_warning = true
    end

    local battery_widget = wibox.widget {
        {
            {
                {
                    id = "icon",
                    font = beautiful.nerd_font .. " 26",
                    widget = wibox.widget.textbox,
                    resize = false
                },
                right = dpi(5),
                widget = wibox.container.margin,
            },
            {
                id = "label",
                font = font,
                widget = wibox.widget.textbox
            },
            layout = wibox.layout.fixed.horizontal,
        },
        fg = fg,
        widget = wibox.container.background,
    }

    local label = battery_widget:get_children_by_id("label")[1]
    local icon = battery_widget:get_children_by_id("icon")[1]

    -- Popup with battery info
    -- One way of creating a pop-up notification - naughty.notify
    local notification
    local function show_battery_status()
        awful.spawn.easy_async([[sh -c "acpi"]],
        function(stdout, _, _, _)
            naughty.destroy(notification)
            notification = naughty.notify{
                text =  stdout,
                title = "Battery status",
                timeout = 5,
                hover_timeout = 2,
                screen = mouse.screen
            }
        end
        )
    end

    local function show_battery_warning()
        naughty.notify {
            icon = warning_msg_icon,
            icon_size = 100,
            text = warning_msg_text,
            title = warning_msg_title,
            timeout = 25, -- notify timeout
            hover_timeout = 0.5,
            bg = beautiful.bg_normal,
            fg = beautiful.fg_urgent,
            width = 300,
        }
    end

    local last_battery_check = os.time()
    local batteryType = ""

    watch("acpi -i", 10,
    function(_, stdout)
        local battery_info = {}
        local capacities = {}
        for s in stdout:gmatch("[^\r\n]+") do
            local status, charge_str, _ = string.match(s, ".+: (%a+), (%d?%d?%d)%%,?(.*)")
            if status ~= nil then
                table.insert(battery_info, {status = status, charge = tonumber(charge_str)})
            else
                local cap_str = string.match(s, ".+:.+last full capacity (%d+)")
                table.insert(capacities, tonumber(cap_str))
            end
        end

        local capacity = 0
        for _, cap in ipairs(capacities) do
            capacity = capacity + cap
        end

        local charge = 0
        local status

        for i, batt in ipairs(battery_info) do
            if capacities[i] ~= nil then
                if batt.charge >= charge then
                    status = batt.status -- use most charged battery status
                    -- this is arbitrary, and maybe another metric should be used
                end

                charge = charge + batt.charge * capacities[i]
            end
        end

        charge = charge / capacity

        if (charge <= 0 and charge < 15) then
            batteryType = beautiful.icons.battery.low
            if enable_battery_warning and status ~= "Charging" and os.difftime(os.time(), last_battery_check) > 150 then
                -- show warning every 2.5 min
                last_battery_check = os.time()
                show_battery_warning()
            end
            battery_widget.fg = beautiful.fg_urgent
        elseif (charge >= 15 and charge < 40) then batteryType = beautiful.icons.battery.low_medium
        elseif (charge >= 40 and charge < 60) then batteryType = beautiful.icons.battery.medium
        elseif (charge >= 60 and charge < 80) then batteryType = beautiful.icons.battery.medium_full
        elseif (charge >= 80 and charge <= 100) then batteryType = beautiful.icons.battery.full
        end

        if status == "Charging" then
            label:set_text(string.format("+%d%%", charge))
        else
            label:set_text(string.format("%d%%", charge))
        end

        icon:set_text(batteryType)
    end)

    battery_widget:connect_signal("button::press", function(_,_,_,button)
        if (button == 1) then show_battery_status() end
    end)
    battery_widget:connect_signal("mouse::leave", function() naughty.destroy(notification) end)

    return battery_widget
end

return module
