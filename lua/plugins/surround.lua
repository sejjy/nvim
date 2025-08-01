return {
	{
		"echasnovski/mini.ai",

		version = "*",

		event = "VeryLazy",

		config = function()
			require("mini.ai").setup({
				n_lines = 500,
			})
		end,
	},
	{
		"echasnovski/mini.surround",

		version = "*",

		event = "VeryLazy",

		config = function()
			require("mini.surround").setup({
				mappings = {
					add = "gsa", -- add surrounding
					delete = "gsd", -- delete surrounding
					find = "gsf", -- find surrounding (to the right)
					find_left = "gsF", -- find surrounding (to the left)
					highlight = "gsh", -- highlight surrounding
					replace = "gsr", -- replace surrounding
					update_n_lines = "gsn", -- update `n_lines`
				},

				n_lines = 500,
			})
		end,
	},
}
