local gears = require("gears")
local awful = require("awful")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi


local clientkeys = gears.table.join(
    -- Toggle floating
    awful.key(
        {modkey},
        "f",
        function (c)
            c.floating = not c.floating
            if c.floating then
                c.border_width = dpi(0)
            end
        end,
        {description = "toggle floating", group = "client"}
    ),

    -- Toggle fullscreen
    awful.key(
        { modkey, "Shift"},
        "f",
        function (c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end,
        {description = "toggle fullscreen", group = "client"}
    ),

    awful.key(
        {modkey},
        "u", awful.client.urgent.jumpto,
        {description = "jump to urgent client", group = "client"}
    ),

    awful.key(
        {modkey, "Shift"},
        's',
        function()
            local c = client.focus
            if c.sticky then
                c.floating = not c.floating
                c.sticky = not c.sticky
                c.ontop = not c.ontop
            else
                c.sticky = true
                c.floating = true
                c.ontop = true
            end
        end,
        {description = 'Toggle client sticky', group = 'client'}
    ),


    -- Kill program
    awful.key(
        {modkey},
        "w",
        function (c) c:kill() end,
        {description = "close", group = "client"}
    ),

    -- Move to screen
    awful.key(
        {modkey},
        "o",
        function (c) c:move_to_screen()               end,
        {description = "move to screen", group = "client"}
    ),
    -- Toggle on top
    awful.key(
        {modkey},
        "t",
        function (c) c.ontop = not c.ontop            end,
        {description = "toggle keep on top", group = "client"}
    ),
    awful.key({ modkey,},
    "m",
    function (c)
        c.maximized = not c.maximized
        c:raise()
    end ,
    {description = "(un)maximize", group = "client"}
    ),

    -- Sticky client
    awful.key(
        {modkey},
        's',
        function()
            local c = client.focus
            if c.sticky then
                c.floating = not c.floating
                c.sticky = not c.sticky
                c.ontop = not c.ontop
            else
                c.sticky = true
                c.floating = true
                c.ontop = true
            end
        end,
        {description = 'Toggle client sticky', group = 'client'}
    )
)


return clientkeys
