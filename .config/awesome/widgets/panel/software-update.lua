local awful = require("awful")
local beautiful = require("beautiful")
local cfg = require("config")
local wibox = require("wibox")


local ICON_DIR = "/usr/share/icons/Arc/status/symbolic/"

local function software_update(user_args)
    local args = user_args or {}
    local font = args.font or beautiful.font
    local icon_update = args.icon_update or ICON_DIR .. "software-update-urgent-symbolic.svg"
    local icon_default = args.icon_update or ICON_DIR .. "process-completed-symbolic.svg"

    local widget = wibox.widget {
        {
            {
                id = "icon",
                resize = true,
                forced_height = beautiful.wibar_icon_size,
                forced_width = beautiful.wibar_icon_size,
                widget = wibox.widget.imagebox
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
            left = 3,
            widget = wibox.container.margin

        },
        layout = wibox.layout.fixed.horizontal
    }

    local tooltip = awful.tooltip({
        align = "bottom"
    })
    tooltip:add_to_object(widget)

    awful.widget.watch(
        cfg.update.get_count,
        300,
        function (_, stdout)
            local label = widget:get_children_by_id("label")[1]
            local icon = widget:get_children_by_id("icon")[1]
            _G.update_count = stdout:gsub("%s+", "")

            if update_count ~= "0" then
                label:set_text(update_count)
                icon:set_image(icon_update)

                widget:connect_signal('mouse::enter', function()
                    tooltip.text = "The number of software that\nneed an update is: " .. update_count
                end)
            else
                label:set_text("None")
                icon:set_image(icon_default)

                widget:connect_signal('mouse::enter', function()
                    tooltip.text = "Everything is up-to date"
                end)
            end
        end
    )

    widget:connect_signal("button::press", function (_, _, _, button)
        if button == 1 then
            awful.spawn.with_shell(cfg.update.update)
        end
    end)

    return widget
end
return software_update
