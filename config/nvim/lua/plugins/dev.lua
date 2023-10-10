return {
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-vsnip",
            "hrsh7th/vim-vsnip",
            "onsails/lspkind-nvim"
        },
        event = "VeryLazy",
        config = function()
            require('cmp').setup()
        end,
    },
    {
        "kdheepak/lazygit.nvim",
        -- optional for floating window border decoration
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },
    {
        "neovim/nvim-lspconfig",
        config =  function()
            local lspconfig = require('lspconfig')
            lspconfig.lua_ls.setup({})
            lspconfig.pylsp.setup({})
            lspconfig.cmake.setup({})
        end,
    },
    {
        "tomasky/bookmarks.nvim",
        config = function() 
            require('bookmarks').setup()
        end,
    },
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        'simrat39/symbols-outline.nvim',
        config = function()
            require("symbols-outline").setup()
        end,
    },
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },
    },
    {
       "williamboman/mason-lspconfig.nvim",
       config = function() 
           require("mason-lspconfig").setup()
       end,
    },
}
