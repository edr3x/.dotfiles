local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local helpers = require("helpers")

local slider = wibox.widget {
    bar_shape = require("helpers").rrect(9),
    bar_height = 6,
    bar_color = beautiful.bg_focus,
    bar_active_color = beautiful.yellow,
    handle_shape = gears.shape.circle,
    handle_color = beautiful.yellow,
    handle_width = 12,
    value = 25,
    widget = wibox.widget.slider,
}

helpers.add_hover_cursor(slider, "hand1")

local bri_slider = wibox.widget {
    {
        markup = helpers.colorize_text("  ", beautiful.yellow),
        font = beautiful.icon_font2 .. " 14",
        align = "center",
        valign = "center",
        widget = wibox.widget.textbox(),
    },
    slider,
    layout = wibox.layout.fixed.horizontal,
    spacing = 0,
}

awful.spawn.easy_async_with_shell(
    "brightnessctl | grep -i  'current' | awk '{ print $4}' | tr -d \"(%)\"",
    function(stdout)
        local value = string.gsub(stdout, "^%s*(.-)%s*$", "%1")
        bri_slider.value = tonumber(value)
    end
)

slider:connect_signal("property::value", function(_, new_value)
    slider.value = new_value
    awful.spawn("brightnessctl set " .. new_value .. "%", false)
end)

return bri_slider
