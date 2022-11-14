local awful = require("awful")
local beautiful = require("beautiful")
local gears = require("gears")
local wibox = require("wibox")
local helpers = require("helpers")

local icon = wibox.widget {
widget = wibox.widget.imagebox,
  image = gears.filesystem.get_configuration_dir() .. "icons/wifi.svg",
  stylesheet = " * { stroke: "
    .. beautiful.green
    .. " } circle { fill: "
    .. beautiful.bg_subtle
    .. "; }",
  forced_width = 30,
  valign = "center",
  halign = "center",
}

local wifi = wibox.widget {
  {
    icon,
    widget = wibox.container.margin,
    margins = 5,
  },
  widget = wibox.container.background,
  bg = beautiful.bg_subtle,
}

helpers.add_hover_cursor(wifi, "hand1")

local s = false -- off
wifi:buttons {
  awful.button({}, 1, function()
    s = not s
    if s then
      icon.stylesheet =
        " * { stroke: "
          .. beautiful.green
          .. " } circle { fill: "
          .. beautiful.green
          .. "; }",
        awful.spawn "nmcli radio wifi on"
    else
      icon.stylesheet =
        " * { stroke: "
          .. beautiful.black
          .. " } circle { fill: "
          .. beautiful.black
          .. "; }",
        awful.spawn "nmcli radio wifi off"
    end
  end),
}

return wifi
