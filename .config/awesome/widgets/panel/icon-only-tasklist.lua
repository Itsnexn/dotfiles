local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi
local clickable_container = require("widgets.clickable-container")
_G.client = client

local tasklist = function (s)

	local tasklist_buttons = gears.table.join(
		awful.button({ }, 1, function (c)
		   	if c == client.focus then
			   	c.minimized = true
		   	else
				-- c.first_tag:emit_signal("request::select")
			   	c:emit_signal(
				   	"request::activate",
				   	"tasklist",
				   	{raise = true}
			   	)
		   	end
		end),
		awful.button({ }, 3, function()
			--awful.menu.client_list({ theme = { width = 250 } })
			return 1
		end),
		awful.button({ }, 4, function ()
			awful.client.focus.byidx(1)
		end),
		awful.button({ }, 5, function ()
			awful.client.focus.byidx(-1)
		end)
	)

	local widget_tasklist = awful.widget.tasklist {
		screen   = s,
		filter   = awful.widget.tasklist.filter.currenttags,
		buttons  = tasklist_buttons,
		layout   = {
			layout  = wibox.layout.fixed.horizontal,
			spacing = dpi(0)
		},
		-- Notice that there is *NO* wibox.wibox prefix, it is a template,
		-- not a widget instance.
		widget_template = {
			{
                {
                    nil,
                    {
                        awful.widget.clienticon,
                        left = dpi(5),
                        right = dpi(2.5),
                        bottom = dpi(5),
                        widget = clickable_container
                    },
                    {
                        id = "background_role",
                        forced_height = dpi(2),
                        widget = wibox.container.background
                    },
                    nil,
                    expand = "inside",
                    widget = wibox.layout.align.vertical,
                },
                widget = wibox.container.background,
                id = "background"
			},
			widget = wibox.container.place,
			create_callback = function (self, _, _, _)
				self:get_children_by_id('background')[1].bg = beautiful.bg_tasklist_active
			end,
			update_callback = function (self, c, _, _)
				local widget_background = self:get_children_by_id("background")[1]
				if c.active then
					widget_background.bg = beautiful.bg_tasklist_active
				else
					widget_background.bg = beautiful.bg_transparent
				end
			end
		},
	}

	return widget_tasklist

end


function tasklist_container(s)
	return wibox.widget{
		widget = wibox.container.place,
		halign = "left",
		tasklist(s)
	}
end

return tasklist_container
