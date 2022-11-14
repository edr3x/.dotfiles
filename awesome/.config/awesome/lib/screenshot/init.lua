local awful = require("awful")
local naughty = require("naughty")

timers = { 5, 10 }
screenshot = os.getenv("HOME") .. "/screenshots/$(date +%F_%T).png"

function scrot_full()
    scrot("scrot " .. screenshot .. " -e 'xclip -selection c -t image/png < $f', scrot_callback", scrot_callback,
        "Take a screenshot of entire screen")
end

function scrot_selection()
    scrot("sleep 0.5 && scrot -s " .. screenshot .. " -e 'xclip -selection c -t image/png < $f'", scrot_callback,
        "Take a screenshot of selection")
end

function scrot_window()
    scrot("scrot -u " .. screenshot .. " -e 'xclip -selection c -t image/png < $f'", scrot_callback,
        "Take a screenshot of focused window")
end

function scrot_delay()
    items = {}
    for key, value in ipairs(timers) do
        items[#items + 1] = { tostring(value),
            "scrot -d " .. value .. " " .. screenshot .. " -e 'xclip -selection c -t image/png < $f'",
            "Take a screenshot of delay" }
    end
    awful.menu.new(
        {
            items = items
        }
    ):show({ keygrabber = true })
    scrot_callback()
end

function scrot(cmd, callback, args)
    awful.util.spawn_with_shell(cmd)
    callback(args)
end

function scrot_callback(text)
    naughty.notify({
        text = text,
        timeout = 0.5
    })
end
