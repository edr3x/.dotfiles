local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local packer_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    packer_bootstrap = true
    vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
    vim.cmd [[packadd packer.nvim]]
end

local status, packer = pcall(require, "packer")
if not status then
    return
end

return packer.startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'edr3x/better-escape.nvim'
    use 'edr3x/lualine.nvim'
    use 'akinsho/toggleterm.nvim'
    use 'windwp/nvim-autopairs'
    use 'nvim-telescope/telescope.nvim'
    use 'tpope/vim-commentary'
    use 'ThePrimeagen/harpoon'
    use 'ThePrimeagen/vim-be-good'
    use 'andweeb/presence.nvim'
    use {
        'DaikyXendo/nvim-tree.lua',
        requires = {
            'DaikyXendo/nvim-material-icon'
        },
    }
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function() require('nvim-treesitter.install').update({ with_sync = true }) end or ':TSUpdate',
    }
    use { 'sindrets/diffview.nvim',
        requires = {
            'nvim-tree/nvim-web-devicons',
        },
    }
    use {
        'toppair/peek.nvim',
        run = 'deno task --quiet build:fast',
        commit = "18284b64f6c5103ccf18d6b53f288d2b2de2dc4a"
    }
    use {
        "folke/tokyonight.nvim",
        commit = "06d0eadc5e8efe6b2516675c75614df36117eaf1"
    }
    use {
        'RRethy/vim-illuminate',
        commit = "a6d0b28ea7d6b9d139374be1f94a16bd120fcda3"
    }
    use 'edr3x/nvim-treesitter-context'
    use 'mrjones2014/nvim-ts-rainbow'
    use 'NvChad/nvim-colorizer.lua'
    use 'lewis6991/gitsigns.nvim'
    use 'folke/trouble.nvim'
    use 'folke/todo-comments.nvim'
    use 'goolord/alpha-nvim'
    use 'mbbill/undotree'

    -- LSP and cmp
    use 'neovim/nvim-lspconfig'
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/nvim-cmp'
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'
    use 'ray-x/lsp_signature.nvim'
    use 'jose-elias-alvarez/null-ls.nvim'
    use 'windwp/nvim-ts-autotag'

    -- Language specific
    use 'akinsho/flutter-tools.nvim'
    use { 'simrat39/rust-tools.nvim', ft = { "rust" } }
    use { "mfussenegger/nvim-jdtls", ft = { "java" } }

    -- Debugging
    --use 'mfussenegger/nvim-dap'
    --use 'ravenxrz/DAPInstall.nvim'
    --use 'rcarriga/nvim-dap-ui'
    --use 'theHamsta/nvim-dap-virtual-text'
    --use 'nvim-telescope/telescope-dap.nvim'
    --use 'leoluz/nvim-dap-go'

    if packer_bootstrap then
        require('packer').sync()
    end
end)
