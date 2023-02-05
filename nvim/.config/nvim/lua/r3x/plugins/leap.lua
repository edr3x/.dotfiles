return {
    'ggandor/leap.nvim',
    cmd = "Leap",
    config = function()
        require("leap").add_default_mappings()
    end
}
