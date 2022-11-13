local autostart = require('awful').util.spawn_with_shell

autostart('picom')
autostart('setxkbmap -option "caps:escape"')
