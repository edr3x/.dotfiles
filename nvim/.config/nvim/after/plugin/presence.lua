local status, presence = pcall(require, "presence")
if not status then
    return
end

presence:setup({
    auto_update        = true,
    show_time          = true,
    neovim_image_text  = "HELP!, couldn't exit.",
    main_image         = "file",
    editing_text       = "Editing %s",
    file_explorer_text = "Browsing %s",
    reading_text       = "Reading %s",
    workspace_text     = "Working on %s",
})
