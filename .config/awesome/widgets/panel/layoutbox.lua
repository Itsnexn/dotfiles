local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local beautiful = require("beautiful")
local clickable_container = require("widgets.clickable-container")
local dpi = beautiful.xresources.apply_dpi

local layoutbox = function (s)

	local layoutbox_wrapped = wibox.widget {
		{
            {
                widget = awful.widget.layoutbox(s),
                forced_height = beautiful.wibar_icon_size,
                forced_width = beautiful.wibar_icon_size,
             },
            widget = wibox.container.place,
		},
		widget = clickable_container
	}

	layoutbox_wrapped:buttons(
		gears.table.join(
          	awful.button({ }, 1, function () awful.layout.inc( 1) end),
          	awful.button({ }, 3, function () awful.layout.inc(-1) end),
          	awful.button({ }, 4, function () awful.layout.inc( 1) end),
          	awful.button({ }, 5, function () awful.layout.inc(-1) end)
		)
	)

	return layoutbox_wrapped;
end

return layoutbox
