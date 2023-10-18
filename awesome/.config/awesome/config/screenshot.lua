local awful = require("awful")

screenshot = os.getenv("HOME") .. "/screenshots/$(date +%F_%T).png"

function scrot_full()
    scrot("flameshot full -c -p " .. screenshot)
end

function scrot_selection_and_edit()
    scrot("flameshot gui -c --raw > " .. screenshot)
end

function scrot_selection()
    scrot("flameshot gui -s -c --raw > " .. screenshot)
end

function scrot(cmd)
    awful.util.spawn_with_shell(cmd)
end
