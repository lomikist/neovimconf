local plugins = {
	{ lazy = true, "nvim-lua/plenary.nvim" },
	{
		"EdenEast/nightfox.nvim",
		priority = 1000,
		config = true,
	},
	{'tpope/vim-obsession'},
	{'tanvirtin/monokai.nvim'},
	{'polirritmico/monokai-nightasty.nvim'},
	{'rebelot/kanagawa.nvim'},
	{'ribru17/bamboo.nvim'},
	{'Pocco81/auto-save.nvim'},
	{"mg979/vim-visual-multi"}, 
	{
		"nvim-tree/nvim-tree.lua",
		cmd = { "NvimTreeToggle", "NvimTreeFocus" },
		config = function()
			require("nvim-tree").setup()
		end,
	},

	-- icons, for UI related plugins
	{
		"nvim-tree/nvim-web-devicons",
		config = function()
			require("nvim-web-devicons").setup()
		end,
	},

	-- syntax highlighting
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require "plugins.configs.treesitter"
		end,
	},
	{ 
		"nvim-tree/nvim-tree.lua",
		cmd = { "NvimTreeToggle", "NvimTreeFocus", "NvimTreeFindFileToggle" },
		config = function()
			require("nvim-tree").setup({
				update_focused_file = {
					enable = true,
					update_root = true,
				},
			})
		end,
	},

	-- buffer + tab line
	{
		"akinsho/bufferline.nvim",
		event = "BufReadPre",
		config = function()
			require "plugins.configs.bufferline"
		end,
	},

	-- statusline

	{
		"echasnovski/mini.statusline",
		config = function()
			require("mini.statusline").setup { set_vim_settings = false }
		end,
	},

	-- we use cmp plugin only when in insert mode
	-- so lets lazyload it at InsertEnter event, to know all the events check h-events
	-- completion , now all of these plugins are dependent on cmp, we load them after cmp
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			-- cmp sources
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-nvim-lsp",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lua",

			-- snippets
			--list of default snippets
			"rafamadriz/friendly-snippets",

			-- snippets engine
			{
				"L3MON4D3/LuaSnip",
				config = function()
					require("luasnip.loaders.from_vscode").lazy_load()
				end,
			},

			-- autopairs , autocompletes ()[] etc
			{
				"windwp/nvim-autopairs",
				config = function()
					require("nvim-autopairs").setup()

					--     cmp integration
					local cmp_autopairs = require "nvim-autopairs.completion.cmp"
					local cmp = require "cmp"
					cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
				end,
			},
		},
		config = function()
			require "plugins.configs.cmp"
		end,
	},

	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"clangd",
				"clang-format",
			}
		},
		build = ":MasonUpdate",
		cmd = { "Mason", "MasonInstall" },
		config = function()
			require("mason").setup()
		end,
	},

	-- lsp
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require "plugins.configs.lspconfig"
		end,
	},
	-- formatting , linting
	{
		"stevearc/conform.nvim",
		lazy = true,
		config = function()
			require "plugins.configs.conform"
		end,
	},

	-- indent lines
	{
		"lukas-reineke/indent-blankline.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("ibl").setup {
				indent = { char = "│" },
				scope = { char = "│", highlight = "Comment" },
			}
		end,
	},

	-- files finder etc
	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		config = function()
			require "plugins.configs.telescope"
		end,
	},

	-- git status on signcolumn etc
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("gitsigns").setup()
		end,
	},
	-- git status on signcolumn etc
	{ "lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("gitsigns").setup {
				current_line_blame = true,
				current_line_blame_opts = {
					virt_text = true,          -- Show blame as virtual text
					virt_text_pos = 'eol',     -- Position the blame at the end of the line
					delay = 10,               -- Delay before showing the blame
					ignore_whitespace = false, -- Consider whitespace changes
				},
				current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
			}
		end,
	}, 
	-- code minimap on right side like vscode
	{
		"echasnovski/mini.map",
		version = false,
		config = function()
			local minimap = require("mini.map")

			minimap.setup({
				integrations = {
					minimap.gen_integration.builtin_search(),
					minimap.gen_integration.diagnostic(),
					minimap.gen_integration.gitsigns(), -- if you use gitsigns.nvim
				},
				symbols = { encode = minimap.gen_encode_symbols.dot("4x2") },
				window = { width = 10, focusable = false },
			})

			-- highlight groups (adapt colors to your taste/colorscheme)
			vim.api.nvim_set_hl(0, "MiniMapNormal", { link = "Normal" })
			vim.api.nvim_set_hl(0, "MiniMapSymbolView", { fg = "#7aa2f7" })       -- cursor pos
			vim.api.nvim_set_hl(0, "MiniMapSymbolSearch", { fg = "#e0af68" })     -- search
			vim.api.nvim_set_hl(0, "MiniMapSymbolDiagnosticError", { fg = "#f7768e" })
			vim.api.nvim_set_hl(0, "MiniMapSymbolDiagnosticWarn", { fg = "#e0af68" })
			vim.api.nvim_set_hl(0, "MiniMapSymbolDiagnosticInfo", { fg = "#7dcfff" })
			vim.api.nvim_set_hl(0, "MiniMapSymbolDiagnosticHint", { fg = "#9ece6a" })
			vim.api.nvim_set_hl(0, "MiniMapSymbolGitAdd", { fg = "#9ece6a" })
			vim.api.nvim_set_hl(0, "MiniMapSymbolGitChange", { fg = "#e0af68" })
			vim.api.nvim_set_hl(0, "MiniMapSymbolGitDelete", { fg = "#f7768e" })

			-- auto open minimap
			vim.api.nvim_create_autocmd("BufEnter", {
				callback = function()
					minimap.open()
				end,
			})
		end,
	}
}

require("lazy").setup(plugins, require "lazy_config")
