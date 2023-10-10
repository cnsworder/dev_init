return {
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require("lualine").setup()
        end,
    },
    {
        'glepnir/dashboard-nvim',
        event = 'VimEnter',
        config = function()
            require('dashboard').setup {
                -- config
            }
        end,
        dependencies = { {'nvim-tree/nvim-web-devicons'}}
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
	    'nvim-telescope/telescope.nvim',
	    dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
    },
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
            -- add any options here
        },
        dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            --   If not available, we use `mini` as the fallback
            "rcarriga/nvim-notify",
        }
    },
    {
        "nvimdev/guard.nvim",
        dependencies = {
            "nvimdev/guard-collection",
        },
    }
}
