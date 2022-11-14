local awful = require('awful')
local wibox = require('wibox')

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
