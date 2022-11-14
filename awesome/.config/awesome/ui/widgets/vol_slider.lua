local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")
local helpers = require("helpers")

local slider = wibox.widget {
  bar_shape = require("helpers").rrect(9),
  bar_height = 6,
  bar_color = beautiful.bg_focus,
  bar_active_color = beautiful.blue,
  handle_shape = gears.shape.circle,
  handle_color = beautiful.blue,
  handle_width = 12,
  value = 75,
  widget = wibox.widget.slider,
}

helpers.add_hover_cursor(slider, "hand1")

local vol_slider = wibox.widget {
  {
                markup = helpers.colorize_text(" ", beautiful.blue),
                font = beautiful.icon_font2 .. " 14",
                align = "center",
                valign = "center",
                widget = wibox.widget.textbox(),
  },
  slider,
  layout = wibox.layout.fixed.horizontal,
  spacing = 0,
}

awful.spawn.easy_async_with_shell("pamixer --get-volume", function(stdout)
	local value = string.gsub(stdout, "^%s*(.-)%s*$", "%1")
	vol_slider.value = tonumber(value)
end)

slider:connect_signal("property::value", function(_, new_value)
	vol_slider.value = new_value
	awful.spawn("pamixer --set-volume " .. new_value, false)
end)
return vol_slider
