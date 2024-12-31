return {
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require("lualine").setup()
        end,
    },
    {
        -- 启动界面
        'glepnir/dashboard-nvim',
        event = 'VimEnter',
        config = function()
            require('dashboard').setup()
        end,
        dependencies = { {'nvim-tree/nvim-web-devicons'}}
    },
    {
        -- 浮动命令行
        "numToStr/FTerm.nvim",
        config = function()
            require("FTerm").setup({
                ft = 'FTerm',
                border = 'single',
                cmd = os.getenv('SHELL')
            })
            vim.api.nvim_create_user_command(
                'FTermToggle',
                require('FTerm').toggle, 
                { bang = true }
                )
            vim.keymap.set('n', '<C-i>', '<CMD>lua require("FTerm").toggle()<CR>')
        end,
    },
    {
        "xiyaowong/nvim-transparent"
    },
    {
        'nvim-treesitter/nvim-treesitter-context',
        config = function()
            require('treesitter-context').setup()
        end,
    },
    {
        -- theme
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
        -- 文件列表
        "luukvbaal/nnn.nvim",
        config = function()
            require('nnn').setup()
        end,
    },
    {
        -- 搜索
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            require("telescope").load_extension("noice")
        end,
    },
    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = {
            "nvim-telescope/telescope.nvim",
            "nvim-lua/plenary.nvim"
        },
        config = function()
            require("telescope").load_extension("file_browser")
        end,
    },
    {
        "nvim-telescope/telescope-project.nvim",
        dependencies = {
            "nvim-telescope/telescope.nvim",
        },
        config = function()
            require("telescope").load_extension("project")
        end,
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
        -- 通知
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
        -- 文档内搜索
        "folke/flash.nvim",
        event = "VeryLazy",
        opts = {},
        -- stylua: ignore
        keys = {
            {
                "s",
                mode = { "n", "x", "o" },
                function()
                    require("flash").jump()
                end,
                desc = "Flash"
            },
            {
                "S",
                mode = { "n", "x", "o" },
                function()
                    require("flash").treesitter()
                end,
                desc = "Flash Treesitter"
            },
            {
                "r",
                mode = "o",
                function()
                    require("flash").remote()
                end,
                desc = "Remote Flash"
            },
            {
                "R",
                mode = { "o", "x" },
                function()
                    require("flash").treesitter_search()
                end,
                desc = "Treesitter Search"
            },
            {
                "<c-s>",
                mode = { "c" },
                function()
                    require("flash").toggle()
                end,
                desc = "Toggle Flash Search"
            },
        },
    },
    {
        -- 格式化
        "nvimdev/guard.nvim",
        dependencies = {
            "nvimdev/guard-collection",
        },
    }
}
