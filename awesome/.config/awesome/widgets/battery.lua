local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local helpers = require("helpers")

local function get_battery_color(percentage)
    if percentage >= 80 then
        return beautiful.white
    elseif percentage >= 50 then
        return beautiful.yellow
    elseif percentage >= 20 then
        return beautiful.orange
    else
        return beautiful.red
    end
end

local function update_battery_widget(widget, stdout)
    -- set default text color
    local colored_text = helpers.colorize_text(stdout, beautiful.yellow)

    local battery_percentage = tonumber(string.match(stdout, "(%d+)%%"))
    if battery_percentage then
        local color = get_battery_color(battery_percentage)
        colored_text = helpers.colorize_text(stdout, color)
    end

    widget:set_markup(colored_text)
end

local battery_widget = wibox.widget.textbox()

-- NOTE: this runs script from https://github.com/edr3x/.dotfiles/blob/master/scripts/.local/scripts/battery-status
-- thus put the script on your $PATH
awful.widget.watch("battery-status", 10, update_battery_widget, battery_widget)

local battery_status = {
    widget = wibox.container.margin,
    {
        widget = battery_widget,
        font = beautiful.font_name .. " Bold 11",
        align = "center",
    },
    left = 10,
}

return battery_status
