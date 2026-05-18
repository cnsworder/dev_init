return {
	--[[ {
		-- lsp客户端
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-vsnip",
			"hrsh7th/vim-vsnip",
			"onsails/lspkind-nvim",
		},
		event = "VeryLazy",
		config = function()
			require("cmp").setup()
		end,
	},]]
	{
		-- lsp 客户端
		"saghen/blink.cmp",
		dependencies = { "rafamadriz/friendly-snippets" },
		version = "*",
		event = { "InsertEnter", "CmdlineEnter" },
		opts = {
			keymap = { preset = "default" },
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},
            completion = {
                keyword = {
                    range = "full",
                },
                list = { selection = { preselect = false, auto_insert = true}},
                documentation = {
                    auto_show = true,
                    auto_show_delay_ms = 500,
                },
            },
			fuzzy = { implementation = "prefer_rust_with_warning" },
		},
	},
	{
		-- lsp配置
		"neovim/nvim-lspconfig",
		config = function()
			vim.lsp.config("lua_ls", {})
			vim.lsp.config("pylyzer", {})
			vim.lsp.config("cmake", {})
			vim.lsp.config("rust_analyzer", {})
			vim.lsp.config("gopls", {})
		end,
	},
	{
		-- mason 配置
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
        -- tags
        "majutsushi/tagbar"
    },
    {
        -- AI
        "madox2/vim-ai"
    },
    {
        "yetone/avante.nvim",
        -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
        -- ⚠️ must add this setting! ! !
        build = vim.fn.has("win32") ~= 0
        and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
        or "make",
        event = "VeryLazy",
        version = false, -- Never set this value to "*"! Never!
        ---@module 'avante'
        ---@type avante.Config
        opts = {
            -- add any opts here
            -- this file can contain specific instructions for your project
            instructions_file = "avante.md",
            -- for example
            provider = "openai",
            providers = {
                openai = {
                    endpoint = "https://api.minimaxi.com/v1",
                    model = "MiniMax-M2.5",
                    api_key_name = "MINIMAX_API_KEY",
                    timeout = 3000
                }
            }
        },
        acp_providers = {
            ["opencode"] = {
                command = "opencode",
                args = { "acp" }
            }
        },
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            --- The below dependencies are optional,
            "nvim-mini/mini.pick", -- for file_selector provider mini.pick
            "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
            "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
            "ibhagwan/fzf-lua", -- for file_selector provider fzf
            "stevearc/dressing.nvim", -- for input provider dressing
            "folke/snacks.nvim", -- for input provider snacks
            "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
            "zbirenbaum/copilot.lua", -- for providers='copilot'
            {
                -- support for image pasting
                "HakonHarnes/img-clip.nvim",
                event = "VeryLazy",
                opts = {
                    -- recommended settings
                    default = {
                        embed_image_as_base64 = false,
                        prompt_for_file_name = false,
                        drag_and_drop = {
                            insert_mode = true,
                        },
                        -- required for Windows users
                        use_absolute_path = true,
                    },
                },
            },
            {
                -- Make sure to set this up properly if you have lazy=true
                'MeanderingProgrammer/render-markdown.nvim',
                opts = {
                    file_types = { "markdown", "Avante" },
                },
                ft = { "markdown", "Avante" },
            },
        },
    },
    {
        -- aider
        "GeorgesAlkhouri/nvim-aider",
        cmd = "Aider",
        dependencies = {
            { "folke/snacks.nvim", version = ">=2.24.0" },
            --- The below dependencies are optional
            "catppuccin/nvim",
            "nvim-tree/nvim-tree.lua",
            --- Neo-tree integration
            {
             "nvim-neo-tree/neo-tree.nvim",
                opts = function(_, opts)
                    require("nvim_aider.neo_tree").setup(opts)
            end,
            },
        },
        config = function()
            require("nvim_aider").setup({
                aider_cmd="aider",
                args = {
                    "--config ~/.config/aider.yml"
                },
            })
        end,
    },
	{
		-- 任务
		"stevearc/overseer.nvim",
		config = function()
			require("overseer").setup()
		end,
		keys = {
			{
				"<leader>r",
				mode = "n",
				"<CMD>OverseerRun<CR>",
			},
		},
	},
	{
		-- 格式化
		"stevearc/conform.nvim",
		opts = {},
	},
	{
		-- 标签
		"tomasky/bookmarks.nvim",
		config = function()
			require("bookmarks").setup()
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		---@module "ibl"
		---@type ibl.config
		opts = {},
	},
	{ -- Breadcrumbs
		"Bekaboo/dropbar.nvim",
		lazy = false,
		-- Optional, but required for fuzzy finder support
		dependencies = {
			"nvim-telescope/telescope-fzf-native.nvim",
		},
	},
	{ -- Rainbow pair colorization
		"hiphish/rainbow-delimiters.nvim",
		lazy = false,
	},
	{
		-- git
		"kdheepak/lazygit.nvim",
		-- optional for floating window border decoration
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
	{
		-- git
		"FabijanZulj/blame.nvim",
		lazy = false,
		config = function()
			require("blame").setup({})
		end,
	},
	{
		-- dash
		"sunaku/vim-dasht"
	},
	{
		-- 符号列表
		"simrat39/symbols-outline.nvim",
		config = function()
			require("symbols-outline").setup()
		end,
	},
	{
		-- 问题列表
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
	},
    {
        "norcalli/nvim-colorizer.lua",
        config = function () 
            require("colorizer").setup()
        end
    },
    {
        --debug
        "mfussenegger/nvim-dap"
    },
    { 
        "rcarriga/nvim-dap-ui",
        dependencies = {
            "mfussenegger/nvim-dap",
            "nvim-neotest/nvim-nio"
        },
	config = function ()
		require("dapui").setup()
	end
    },
}
