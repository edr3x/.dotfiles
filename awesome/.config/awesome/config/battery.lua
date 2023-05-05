local io = io
local math = math

local battery = {}

local function file_exists(name)
    local f = io.open(name, "r")
    if f ~= nil then
        io.close(f)
        return true
    else
        return false
    end
end

local function get_adapters()
    local adapters = { "BAT0", "BAT1" }
    local found_adapters = {}
    local c = 1
    for i = 1, #adapters do
        if file_exists("/sys/class/power_supply/" .. adapters[i] .. "/status") then
            found_adapters[c] = adapters[i]
            c = c + 1
        end
    end
    return found_adapters
end

local function get_bat_state(adapter)
    local adapter_path = "/sys/class/power_supply/" .. adapter
    local fprefix = ""
    if file_exists(adapter_path .. "/energy_now") then
        fprefix = "energy"
    else
        fprefix = "charge"
    end
    local fcur = io.open(adapter_path .. "/" .. fprefix .. "_now")
    local fcap = io.open(adapter_path .. "/" .. fprefix .. "_full")
    local fsta = io.open(adapter_path .. "/status")
    local cur = fcur:read()
    local cap = fcap:read()
    local sta = fsta:read()
    fcur:close()
    fcap:close()
    fsta:close()

    local battery = math.floor(cur * 100 / cap)
    if sta:match("Charging") then
        dir = 1
    elseif sta:match("Discharging") then
        dir = -1
    else
        dir = 0
    end
    return battery, dir
end

function battery.closure()
    local adapters = get_adapters()
    return function()
        local prefix = "⚡"
        local batteries = ""
        for i = 1, #adapters do
            adapter = adapters[i]
            local battery, dir = get_bat_state(adapter)
            if dir == -1 then
                prefix = "󰂁 "
            end
            battery = battery .. "%"
            batteries = batteries .. " " .. battery .. " "
        end
        return prefix .. "" .. batteries:gsub("%s+$", "")
    end
end

return battery
