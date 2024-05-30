local gears = require("gears")

local helpers = {}

-- Create rounded rectangle shape (in one line)
helpers.rrect = function(radius)
    return function(cr, width, height)
        gears.shape.rounded_rect(cr, width, height, radius)
    end
end

-- Markup helper
helpers.colorize_text = function(txt, fg)
    return "<span foreground='" .. fg .. "'>" .. txt .. "</span>"
end

return helpers
