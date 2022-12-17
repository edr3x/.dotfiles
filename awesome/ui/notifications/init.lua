local naughty = require("naughty")
local beautiful = require("beautiful")
local wibox = require("wibox")
local awful = require("awful")
local dpi = beautiful.xresources.apply_dpi
local helpers = require("helpers")
local ruled = require("ruled")
local menubar = require("menubar")
local gears = require("gears")

require("ui.notifications.err")

-- icon
naughty.connect_signal("request::icon", function(n, context, hints)
    if context ~= "app_icon" then return end

    local path = menubar.utils.lookup_icon(hints.app_icon) or menubar.utils.lookup_icon(hints.app_icon:lower())

    if path then n.icon = path end

end)

naughty.config.defaults.ontop        = true
naughty.config.defaults.screen       = awful.screen.focused()
naughty.config.defaults.timeout      = 3
naughty.config.defaults.title        = "Notification!"
naughty.config.defaults.position     = "top_right"
naughty.config.defaults.border_width = 0

naughty.config.presets.low.timeout      = 3
naughty.config.presets.critical.timeout = 0

naughty.config.presets.normal = {
    font = beautiful.font,
    fg   = beautiful.fg_normal,
    bg   = beautiful.bg_normal
}

naughty.config.presets.low = {
    font = beautiful.font_name .. "10",
    fg = beautiful.fg_normal,
    bg = beautiful.bg_normal
}

naughty.config.presets.critical = {
    font = beautiful.font_name .. "12",
    fg = beautiful.red,
    bg = beautiful.red,
    timeout = 0
}


naughty.config.presets.ok   = naughty.config.presets.normal
naughty.config.presets.info = naughty.config.presets.normal
naughty.config.presets.warn = naughty.config.presets.critical


ruled.notification.connect_signal("request::rules", function()
    ruled.notification.append_rule {
        rule = {},
        properties = { screen = awful.screen.preferred, implicit_timeout = 6 }
    }
end)

naughty.connect_signal("request::display", function(n)

    -- action widget
    local action_widget = {
        {
            {
                id = "text_role",
                align = "center",
                valign = "center",
                font = beautiful.font_name .. "Bold 10",
                widget = wibox.widget.textbox
            },
            left = dpi(6),
            right = dpi(6),
            widget = wibox.container.margin
        },
        bg = beautiful.bg_2,
        forced_height = dpi(30),
        shape = helpers.rrect(dpi(5)),
        widget = wibox.container.background
    }


    local actions = wibox.widget {
        notification = n,
        base_layout = wibox.widget {
            spacing = dpi(8),
            layout = wibox.layout.flex.horizontal
        },
        widget_template = action_widget,
        style = { underline_normal = false, underline_selected = true },
        widget = naughty.list.actions
    }

    local image_n = wibox.widget {
        {
            image = n.icon,
            resize = true,
            clip_shape = helpers.rrect(beautiful.rounded),
            halign = "center",
            valign = "center",
            widget = wibox.widget.imagebox,
        },
        strategy = "exact",
        height = dpi(72),
        width = dpi(72),
        widget = wibox.container.constraint,
    }


    local title_n = wibox.widget {
        {
            {
                markup = n.title,
                font   = beautiful.font_name .. "Bold 13",
                align  = "left",
                valign = "center",
                widget = wibox.widget.textbox
            },
            forced_width  = dpi(200),
            widget        = wibox.container.scroll.horizontal,
            step_function = wibox.container.scroll.step_functions.waiting_nonlinear_back_and_forth,
            speed         = 50
        },
        margins = { right = 15 },
        widget  = wibox.container.margin
    }


    local message_n = wibox.widget {
        {
            {
                markup = helpers.colorize_text("<span weight='normal'>" .. n.message .. "</span>",
                    beautiful.fg_normal .. "BF"),
                font   = beautiful.font_name .. "Bold 11",
                align  = "left",
                valign = "center",
                wrap   = "char",
                widget = wibox.widget.textbox
            },
            forced_width = dpi(200),
            layout       = wibox.layout.fixed.horizontal
        },
        margins = { right = 15 },
        widget  = wibox.container.margin
    }


    local app_name_n = wibox.widget {
        markup = helpers.colorize_text(n.app_name, beautiful.fg_normal .. "BF"),
        font   = beautiful.font_name .. " 10",
        align  = "left",
        valign = "center",
        widget = wibox.widget.textbox
    }

    local time_n = wibox.widget {
        {
            markup = helpers.colorize_text("now", beautiful.fg_normal .. "BF"),
            font   = beautiful.font_name .. " 10",
            align  = "right",
            valign = "center",
            widget = wibox.widget.textbox
        },
        margins = { right = 20 },
        widget  = wibox.container.margin
    }


    local notif_info = wibox.widget {
        app_name_n,
        {
            widget = wibox.widget.separator,
            shape = gears.shape.circle,
            forced_height = dpi(4),
            forced_width = dpi(4),
            color = beautiful.fg_normal .. "BF"
        },
        time_n,
        layout = wibox.layout.fixed.horizontal,
        spacing = dpi(7)
    }


    naughty.layout.box {
        notification    = n,
        type            = "notification",
        bg              = beautiful.bg_normal,
        shape           = helpers.rrect(beautiful.rounded),
        widget_template = {
            {
                {
                    {
                        {
                            notif_info,
                            {
                                {
                                    title_n,
                                    message_n,
                                    layout = wibox.layout.fixed.vertical,
                                    spacing = dpi(3)
                                },
                                margins = { left = dpi(6) },
                                widget = wibox.container.margin
                            },
                            layout = wibox.layout.fixed.vertical,
                            spacing = dpi(16)
                        },
                        nil,
                        image_n,
                        layout = wibox.layout.align.horizontal,
                        expand = "none"
                    },
                    {
                        { actions, layout = wibox.layout.fixed.vertical },
                        margins = { top = dpi(20) },
                        visible = n.actions and #n.actions > 0,
                        widget = wibox.container.margin
                    },
                    layout = wibox.layout.fixed.vertical,
                },
                margins = dpi(18),
                widget = wibox.container.margin
            },
            widget       = wibox.container.background,
            forced_width = dpi(340),
            shape        = helpers.rrect(beautiful.rounded),
            bg           = beautiful.bg_normal,
        }
    }

end)
