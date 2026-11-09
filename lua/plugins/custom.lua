return {
	
{
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	opts = {
		flavour = "mocha",
		transparent_background = false,
	},
},

{
	"nvim-telescope/telescope.nvim",
	opts = {
		defaults = {
			layout_strategy = "horizontal",
			layout_config = { prompt_position = "top" },
			sorting_strategy = "ascending",
		},
	},
},


{
	"nvim-treesitter/nvim-treesitter",
	opts = function(_, opts)
	  vim.list_extend(opts.ensure_installed, {
	  	"c",
	  	"cpp",
	  	"python",
	  	"fish",
	  })
	end,  
},

{
	"kawre/leetcode.nvim",
	build = function() vim.cmd("TSUpdate html")end,
	dependencies = { 
		"nvim-telescope/telescope.nvim",
		"nvim-lua/plenary.nvim",
		"muniftanjim/nui.nvim",
	},
	opts = {
		lang = "c"
	},
},

{
	"CRAG666/code_runner.nvim",
	opts = {
		filetype = {
			c = "gcc % -o %< && ./%<",
			cpp = "g++ % -o %< && ./%<",
			python = "python3 -u",
		},
	},
	keys = {
		{ "space>r", ":RunCode<CR>", desc = "Run Code" },
	},
},

{
	"mason-org/mason.nvim",
	opts = {
		ensure_installed = {
			"clangd",
			"pyright",
			"black",
			"clang-format",
		},
	},
},


{
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	event = { "BufReadPost", "BufNewFile" },
	opts = {
		indent = {
			char = "|",
			tab_char ="|",
		},
		scope = {
			enabled = true,
			show_start = true,
			show_end = false,
			char = "|",
		},
	},
	config = function(_,opts)
	  require("ibl").setup(opts)
	end,  
},

{
	"windwp/nvim-autopairs",
	event = "InsertEnter",
	opts = {},
},

{
	"HiPhish/rainbow-delimiters.nvim",
	event = "BuFReadPost"
},

{
	"numToStr/Comment.nvim",
	event = "VeryLazy"
},

{
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons"},
	opts = {},
	keys = {
		{ "<leader>sb", "<cmd>fzFlua live_grep<cr>", desc = "Search Codebase Text" },
	},
},
}
