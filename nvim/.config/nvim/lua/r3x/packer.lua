vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'edr3x/better-escape.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'jiangmiao/auto-pairs'
    use 'folke/tokyonight.nvim'
    use 'nvim-telescope/telescope.nvim'
    use 'andweeb/presence.nvim'
    use 'neovim/nvim-lspconfig'
    use { 'kyazdani42/nvim-tree.lua', requires = {
        'kyazdani42/nvim-web-devicons',
    },
    }
    use 'folke/trouble.nvim'
    use { "catppuccin/nvim", as = "catppuccin" }
    use 'simrat39/rust-tools.nvim'
    use 'weilbith/nvim-code-action-menu'
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    }
    use 'p00f/nvim-ts-rainbow'
    use 'akinsho/toggleterm.nvim'
    use "williamboman/nvim-lsp-installer"
    use "hrsh7th/cmp-nvim-lsp"
    use 'hrsh7th/nvim-cmp'
    use 'saadparwaiz1/cmp_luasnip'
    use 'onsails/lspkind.nvim'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'feline-nvim/feline.nvim'
    use 'nvim-lualine/lualine.nvim'
    use {
        "akinsho/flutter-tools.nvim",
        requires = { "nvim-lua/plenary.nvim" },
    }
    use "L3MON4D3/LuaSnip"
    use 'NvChad/nvim-colorizer.lua'

    -- debugger
    use 'mfussenegger/nvim-dap'
    use 'leoluz/nvim-dap-go'
    use 'ravenxrz/DAPInstall.nvim'
    use 'rcarriga/nvim-dap-ui'
    use 'theHamsta/nvim-dap-virtual-text'
    use 'nvim-telescope/telescope-dap.nvim'
end)
