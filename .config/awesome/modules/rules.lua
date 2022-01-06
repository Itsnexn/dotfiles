local awful = require("awful")
local naughty = require("naughty")
local beautiful = require("beautiful")
-- Rules to apply to new clients (through the "manage" signal).
local tags = awful.screen.focused().tags
awful.rules.rules = {
    -- All clients will match this rule.
    {
		rule = {},
		properties = {
			border_width = beautiful.border_width,
			border_color = beautiful.border_normal,
			focus = awful.client.focus.filter,
			raise = true,
			keys = clientkeys,
			buttons = clientbuttons,
			screen = awful.screen.preferred,
			placement = awful.placement.no_overlap+awful.placement.no_offscreen
		}
    }, -- Floating clients.
    {
		rule_any = {
			instance = {
			  "pinentry",
			},
			class = {
			  "Arandr",
			  "Blueman-manager",
			  "Gpick",
			  "Kruler",
			  "MessageWin",  -- kalarm.
			  "Sxiv",
			  "Tor Browser", -- Needs a fixed window size to avoid fingerprinting by screen size.
			  "Wpa_gui",
			  "veromix",
			  "xtightvncviewer"},

			-- Note that the name property shown in xprop might be set slightly after creation of the client
			-- and the name shown there might not match defined rules here.
			name = {
			  "Event Tester",  -- xev.
			},
			role = {
			  "pop-up",
			}
      	},
		properties = {
            floating = true,
            titlebars_enabled = true,
        }
	},
    {
        rule = {
            class = "discord"
        },
        properties = {
            tag = tags[8],
        }
    },

    -- Add titlebars to normal clients and dialogs
    {
		rule_any = {
			type = { "normal", "dialog" } },
		properties = { titlebars_enabled = true }
    },
	{
		rule = { instance = "plugin-container" },
	 	roperties = { floating = true }
  	},
	{
		rule = { class= "feh" },
		properties = {
            width = 900,
            height = 700,
            floating = true,
            -- titlebars_enabled = true,
        }
	},
    {
        rule = {
            class = "Dragon"
        },
        properties = {
            x = 42, y = 42,
            floating = true,
            sticky = true,
            ontop = true,
        }
    }
}
