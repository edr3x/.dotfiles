local status, leap = pcall(require, "leap")
if not status then
    return
end

leap.add_default_mappings()
