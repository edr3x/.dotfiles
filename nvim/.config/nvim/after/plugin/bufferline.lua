local status, buffline = pcall(require, "telescope")
if not status then
    return
end

buffline.setup {
    options = {
        right_mouse_command = 'vert sbuffer %d',
        buffer_close_icon = 'x',
        close_icon = '',
        indicator = {
            style = 'underline',
        },
    }
}
