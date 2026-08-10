return {
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
                per_filetype = {
                    codecompanion = { "codecompanion" },
                },
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
        "olimorris/codecompanion.nvim",
        config = function()
            require("codecompanion").setup({
                keys = {
                    toggle_chat = "<leader>cc",
                    toggle_actions = "<leader>cp",
                },
                opts = {
                    language = "Chinese",
                    completion_provider = "blink",
                        triggers = {
                            acp_slash_commands = "\\",
                            editor_context = "#",
                            slash_commands = "/",
                            tools = "@",
                        },
                },
                interactions = {
                    chat = {
                        adapter = "vs",
                    },
                    inline = { adapter = "vs" },
                    cmd = { adapter = "vs" },
                    cmd = { adapter = "vs" },
                },
                adapters = {
                    http = {
                        vs = function()
                            VS_API = vim.env.VS_API
                            return require("codecompanion.adapters").extend("openai_compatible", {
                                env = {
                                    url = VS_API,
                                    api_key = "API_KEY",
                                    chat_url = "/v1/chat/completions",
                                },
                                schema = {
                                    model = {
                                        default = "gpt-5.5",
                                        choices = {
                                            "gpt-5",
                                            "gpt-5.5",
                                        },
                                    },
                                },
                            })
                        end
                    },
                    acp = {
                        opencode = function()
                            return require("codecompanion.adapters").extend("opencode", {
                                commands = {
                                    default = {"opencode", "acp"},
                                },
                            })
                        end,
                    },
                },
            })
        end,
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            "MeanderingProgrammer/render-markdown.nvim",
        },
        opts = {
            language = "Chinese",
            opts = {
                log_level = "DEBUG", -- or "TRACE"
            },
        },
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
