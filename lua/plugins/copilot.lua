return {
	"zbirenbaum/copilot.lua",

	event = "InsertEnter",

	config = function()
		require("copilot").setup({
			panel = {
				enabled = false,
				auto_refresh = false,

				-- defaults for ref
				keymap = {
					jump_prev = "[[",
					jump_next = "]]",
					accept = "<CR>",
					refresh = "gr",
					open = "<M-CR>",
				},
			},

			suggestion = {
				enabled = true,
				-- auto_trigger = true,
				debounce = 50, -- faster suggestions

				-- defaults
				keymap = {
					accept = "<M-y>",
					accept_word = false,
					accept_line = false,
					next = "<M-n>",
					prev = "<M-p>",
					dismiss = "<M-d>",
				},
			},

			filetypes = {
				markdown = false,
				-- sh = false,
				text = false,
				["*"] = true,
			},
		})

		local mocha = require("catppuccin.palettes").get_palette("mocha")

		vim.api.nvim_set_hl(0, "CopilotSuggestion", { fg = mocha.overlay0, italic = true })
	end,
}
