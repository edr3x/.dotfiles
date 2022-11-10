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
    use 'edr3x/better-escape.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'akinsho/toggleterm.nvim'
    use 'jiangmiao/auto-pairs'
    use 'nvim-telescope/telescope.nvim'
    use 'ThePrimeagen/harpoon'
    use 'ThePrimeagen/vim-be-good'
    use 'andweeb/presence.nvim'
    use { 'kyazdani42/nvim-tree.lua', requires = {
        'kyazdani42/nvim-web-devicons',
    },
    }
    use 'folke/trouble.nvim'
    use 'edr3x/lualine.nvim'
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    }
    use 'edr3x/nvim-treesitter-context'
    use 'edr3x/nvim-ts-rainbow'
    use 'NvChad/nvim-colorizer.lua'
    use 'lewis6991/gitsigns.nvim'
    use { 'toppair/peek.nvim', run = 'deno task --quiet build:fast' }
    use 'lewis6991/impatient.nvim'
    use 'xiyaowong/telescope-emoji.nvim'
    use 'tpope/vim-obsession'

    --color
    use 'folke/tokyonight.nvim'

    --LSP and cmp
    use 'neovim/nvim-lspconfig'
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/nvim-cmp'
    use 'saadparwaiz1/cmp_luasnip'
    use 'simrat39/rust-tools.nvim'
    use 'akinsho/flutter-tools.nvim'
    use 'L3MON4D3/LuaSnip'

    -- debugger
    use 'mfussenegger/nvim-dap'
    use 'leoluz/nvim-dap-go'
    use 'ravenxrz/DAPInstall.nvim'
    use 'rcarriga/nvim-dap-ui'
    use 'theHamsta/nvim-dap-virtual-text'
    use 'nvim-telescope/telescope-dap.nvim'

    if packer_bootstrap then
        require('packer').sync()
    end
end)
