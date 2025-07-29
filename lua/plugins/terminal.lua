return {
	"akinsho/toggleterm.nvim",

	version = "*",

	keys = "<A-t>",

	config = function()
		local Terminal = require("toggleterm.terminal").Terminal

		local float_term = Terminal:new({
			cmd = "zsh",
			direction = "float",

			float_opts = {
				border = "single",
				width = math.floor(vim.o.columns * 0.8),
				height = math.floor(vim.o.lines * 0.8),
				title_pos = "right",
			},

			on_open = function(_)
				vim.cmd("startinsert!")
			end,
		})

		function _G.float_term_toggle()
			float_term:toggle()
		end

		vim.keymap.set({ "n", "t" }, "<A-t>", "<Cmd>lua float_term_toggle()<Enter>", { noremap = true, silent = true })
		vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
	end,
}
