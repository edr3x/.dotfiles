local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

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
    use { 'toppair/peek.nvim', run = 'deno task --quiet build:fast' }
    use 'edr3x/nvim-treesitter-context'
    use 'edr3x/nvim-ts-rainbow'
    use 'NvChad/nvim-colorizer.lua'
    use 'lewis6991/gitsigns.nvim'
    use 'RRethy/vim-illuminate'
    use 'folke/trouble.nvim'
    use 'folke/todo-comments.nvim'
    use 'folke/tokyonight.nvim'
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
    use 'jose-elias-alvarez/null-ls.nvim'

    -- Language specific
    use 'simrat39/rust-tools.nvim'
    use 'akinsho/flutter-tools.nvim'
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
