return {
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require("lualine").setup()
        end,
    },
    {
	    "catppuccin/nvim",
        name="catppuccin",
        config = function()
            require("catppuccin").setup()
        end,
    },
    {
	    "nvim-tree/nvim-tree.lua",
	    config = function()
		    require("nvim-tree").setup()
	    end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require('nvim-treesitter').setup()
        end,
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/cmp-vsnip"
        },
        event = "VeryLazy",
        config = function()
            require('cmp').setup()
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config =  function()
            local lspconfig = require('lspconfig')
            lspconfig['lua_ls'].setup({})
        end,
    },
    {
	"williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
       "williamboman/mason-lspconfig.nvim",
       config = function() 
           require("mason-lspconfig").setup()
       end,
    },
    {
	    'nvim-telescope/telescope.nvim',
	    dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {
        "nvimdev/guard.nvim",
        dependencies = {
            "nvimdev/guard-collection",
        },
	
    }
}
