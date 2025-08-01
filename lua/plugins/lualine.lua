return {
	"nvim-lualine/lualine.nvim",

	config = function()
		local function trunc(trunc_width, trunc_len, hide_width, no_ellipsis)
			return function(str)
				local win_width = vim.fn.winwidth(0)
				if hide_width and win_width < hide_width then
					return ""
				elseif trunc_width and trunc_len and win_width < trunc_width and #str > trunc_len then
					return str:sub(1, trunc_len) .. (no_ellipsis and "" or "...")
				end
				return str
			end
		end

		local mocha = require("catppuccin.palettes").get_palette("mocha")

		local inner = "·"
		local iconl = ""
		local iconr = ""
		local trfmt = trunc(0, 0, 75, true)
		local spinner = { "|", "/", "—", "\\" }

		require("lualine").setup({
			options = {
				-- globalstatus = true,
				component_separators = inner .. " ",
				section_separators = { left = iconr, right = iconl },

				disabled_filetypes = {
					statusline = { "neo-tree" },
				},
			},

			sections = {
				lualine_a = {
					{
						"mode",
						separator = { left = iconl, right = iconr .. " " },
						fmt = trunc(75, 1, 0, true),
					},
				},

				lualine_b = {
					{
						"branch",
						icon = "󰘬",
						color = { fg = mocha.text },
						separator = { left = "", right = iconr .. " " },
						padding = { left = 0, right = 1 },
					},
				},

				lualine_c = {
					{
						"diff",
						padding = { left = 0, right = 1 },
						fmt = trfmt,

						symbols = {
							added = "+",
							removed = "-",
							modified = "~",
						},

						diff_color = {
							modified = { fg = mocha.blue },
						},
					},
					{
						"filetype",
						icon_only = true,
						separator = "",
						padding = { left = 0, right = 0 },
						fmt = trfmt,
					},
					{
						"filename",
						padding = { left = 0, right = 0 },
						fmt = trunc(50, 18, 0, false),

						symbols = {
							modified = "[+]", -- file is modified.
							readonly = "[-]", -- file is non-modifiable or readonly.
							unnamed = "[No Name]", -- unnamed buffers.
							newfile = "[New]", -- newly created file before first write
						},
					},
				},

				lualine_x = {
					{
						"diagnostics",
						separator = inner,
					},
					{
						"lsp_status",
						icon = "",
						separator = "",
						padding = { left = 0, right = 1 },
						symbols = { spinner = spinner, done = "", separator = " " .. inner .. " " },
						fmt = trfmt,
					},
				},

				lualine_y = {
					{
						"filesize",
						color = { fg = mocha.text },
						fmt = trfmt,
					},
				},

				lualine_z = {
					{
						"location",
						separator = { left = iconl, right = iconr },
					},
				},
			},

			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = {
					{
						"lsp_status",
						icon = "",
						symbols = { spinner = spinner, done = "", separator = " " },
						fmt = trfmt,
					},
				},
				lualine_y = {},
				lualine_z = {},
			},
		})
	end,
}
