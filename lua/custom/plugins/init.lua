-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the ki€þXkbkstart.nvim README for more information
return {
	{
		'nvim-tree/nvim-web-devicons',
		lazy = false
	},
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		build = ":Copilot auth",
		opts = {
			suggestion = { enabled = false },
			panel = { enabled = false },
			filetypes = {
				markdown = true,
				help = true,
				gitcommit = true,
			},
		},
	},
	{
		"zbirenbaum/copilot-cmp",
		dependencies = "copilot.lua",
		opts = {},
		config = function(_, opts)
			local copilot_cmp = require("copilot_cmp")
			copilot_cmp.setup(opts)
		end,
	},
	{ "AndreM222/copilot-lualine" },
	{
		"theprimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("harpoon"):setup({
				global_settings = {
					save_on_toggle = false,
				},
			})
		end,
		keys = {
			{ "<leader>ha", function() require("harpoon"):list():append() end,  desc = "harpoon file", },
			{
				"<C-e>",
				function()
					local harpoon = require("harpoon")
					harpoon.ui:toggle_quick_menu(harpoon:list())
				end,
				desc = "harpoon quick menu",
			},
			{ "<leader>1",  function() require("harpoon"):list():select(1) end, desc = "harpoon to file 1", },
			{ "<leader>2",  function() require("harpoon"):list():select(2) end, desc = "harpoon to file 2", },
			{ "<leader>3",  function() require("harpoon"):list():select(3) end, desc = "harpoon to file 3", },
			{ "<leader>4",  function() require("harpoon"):list():select(4) end, desc = "harpoon to file 4", },
			{ "<leader>5",  function() require("harpoon"):list():select(5) end, desc = "harpoon to file 5", },
		},
	},
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup()
		end
	},
	{
		"m4xshen/autoclose.nvim",
		config = function()
			require("autoclose").setup()
		end
	}
}
