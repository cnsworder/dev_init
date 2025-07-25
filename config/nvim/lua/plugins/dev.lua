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
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({})
			lspconfig.pylyzer.setup({})
			lspconfig.cmake.setup({})
			lspconfig.rust_analyzer.setup({})
			lspconfig.gopls.setup({})
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
