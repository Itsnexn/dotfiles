local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful") local dpi = beautiful.xresources.apply_dpi
local cfg = require("config")

local function set_text_with_ssid(widget)
	return awful.spawn.easy_async_with_shell(
		"iw dev " .. cfg.network.wlan_interface .. " link",
		function(stdout)
			local essid = stdout:match("SSID: (.-)\n") or "N/A"
			widget:set_text(essid)
		end
	)
end

-- Panel network indicator
local function network_widget(user_args)
    local args = user_args or {}
    local font = args.font or beautiful.font
    local show_label = args.show_label
    local fg_connected = args.fg_connected or beautiful.fg_normal
    local fg_offline = args.fg or beautiful.fg_urgent

    if not show_label then
        Margin = 0
    else
        Margin = 5
    end

    local widget = wibox.widget {
        {
            {
                {
                    id = "icon",
                    -- resize = true,
                    -- forced_height = beautiful.wibar_icon_size,
                    -- forced_width = beautiful.wibar_icon_size,
                    -- widget = wibox.widget.imagebox
                    font = beautiful.nerd_font .. " 22",
                    widget = wibox.widget.textbox
                },
                valigh = "center",
                widget = wibox.container.place
            },
            {
                {
                    id = "label",
                    text = "",
                    font = font,
                    widget = wibox.widget.textbox
                },
                widget = wibox.container.margin,
                left = dpi(Margin)
            },
            layout = wibox.layout.fixed.horizontal
        },
        id = "fg",
        fg = "",
        widget = wibox.container.background
    }

    local label = widget:get_children_by_id("label")[1]
    local panel_icon = widget:get_children_by_id("icon")[1]
    local color = widget:get_children_by_id("fg")[1]

    local update_status = function()
        awful.spawn.easy_async_with_shell(
            [=[
            wireless="]=] .. tostring(cfg.network.wlan_interface) .. [=["
            wired="]=] .. tostring(cfg.network.eth_interface) .. [=["

            wired_state=$(nmcli d | grep ^$wired | awk '{print $3}')
            wireless_state=$(nmcli d | grep ^$wireless | awk '{print $3}')

            if [[ $wired_state == "connected" ]]; then # Wired Connected
                printf "Wired"
            elif [[ $wireless_state == "connected" ]]; then # Wireless Connected
                printf "Wireless"
            elif [[ $wireless_state == "connecting" ]]; then # Trying To connect to a WAP
            printf "Connecting"
            elif [[ $wireless_state == "unavailable" || $wireless_state == "disconnected" ]]; then
                printf "Offline"
            else
                printf "N/A"
            fi
            ]=],

            function(stdout) -- Check Stdout
                if stdout:match("Wired") then
                    if show_label then label:set_text("Connected") end
                    panel_icon:set_text(beautiful.icons.network.wired)
                    color.fg = fg_connected
                elseif stdout:match("Wireless") then
                    if show_label then
                        set_text_with_ssid(label)
                    end
                    panel_icon:set_text(beautiful.icons.network.wireless)
                    color.fg = fg_connected
                elseif stdout:match("Connecting") then
                    if show_label then label:set_text("Connecting...") end
                    color.fg = fg_connected
                    panel_icon:set_text(beautiful.icons.network.wireless)
                elseif stdout:match("Offline") then
                    if show_label then label:set_text("Offline") end
                    panel_icon:set_text(beautiful.icons.network.offline)
                    color.fg = fg_offline
                else
                    if show_label then label:set_text("N/A") end
                    panel_icon:set_text(beautiful.icons.network.offline)
                    color.fg = fg_offline
            end
        end
    )
end

    -- Update Status in every 5 sec
    gears.timer {
        timeout = 3,
        autostart = true,
        call_now = true,
        callback = function ()
            update_status()
        end
    }

    -- Button 3 (Right Click) Off/On
    widget:connect_signal(
        "button::press",
        function (_,_,_,button)
            if button == 3 then
                awful.spawn.easy_async_with_shell("rfkill list wifi", function (stdout)
                    if stdout:match("Soft blocked: yes") then
                        awful.spawn.single_instance("rfkill unblock wifi")
                        label:set_text("Turning on...")
                    else
                        awful.spawn.single_instance("rfkill block wifi")
                        label:set_text("Turning off...")
                    end
                end)
            end
            -- Button 1 (Left Click) Lounch network_manager app
            if button == 1 then
                awful.spawn.single_instance(cfg.network.network_manager)
            end
        end
    )
    return widget
end

return network_widget
