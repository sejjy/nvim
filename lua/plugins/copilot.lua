return {
	"zbirenbaum/copilot.lua",

	event = "InsertEnter",

	config = function()
		require("copilot").setup({
			panel = { enabled = false },

			suggestion = {
				enabled = true,
				-- auto_trigger = true,
				debounce = 50, -- faster suggestions

				keymap = {
					accept = "<A-y>",
					accept_word = false,
					accept_line = false,
					next = "<A-n>",
					prev = "<A-p>",
					dismiss = "<A-d>",
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
