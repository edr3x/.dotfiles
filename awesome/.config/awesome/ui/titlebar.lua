local awful = require('awful')
local wibox = require('wibox')
local gears = require('gears')

client.connect_signal("request::titlebars", function(c)
    awful.titlebar(c, {
        size = 0.5,
        position = "left",
    }):setup {
        {
            layout = wibox.layout.fixed.vertical,
            spacing = 13,
        },
        widget = wibox.container.margin,
        top = 15,
        left = 15,
        right = 15,
    }
end)

client.connect_signal("manage", function(c)
    c.shape = function(cr, w, h)
        gears.shape.rounded_rect(cr, w, h, 6)
    end
end)
