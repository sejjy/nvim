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

		local ldiv, rdiv, idiv = "", "", ""
		local spin = { "|", "/", "—", "\\" }
		local trun = trunc(0, 0, 75, true)

		require("lualine").setup({
			options = {
				component_separators = idiv .. " ",
				section_separators = { left = rdiv, right = ldiv },
			},

			sections = {
				lualine_a = {
					{
						"mode",
						separator = { left = ldiv, right = rdiv .. " " },
						fmt = trunc(75, 1, 0, true),
					},
				},

				lualine_b = {
					{
						"branch",
						icon = "󰘬",
						color = { fg = mocha.text },
						separator = { left = "", right = rdiv .. " " },
						padding = { left = 0, right = 1 },
					},
				},

				lualine_c = {
					{
						"diff",
						padding = { left = 0, right = 1 },
						fmt = trun,
						symbols = { added = "󰐗 ", removed = "󰍶 ", modified = "󰻂 " },
						diff_color = { modified = { fg = mocha.blue } },
					},
					{
						"filetype",
						icon_only = true,
						separator = "",
						padding = { left = 0, right = 0 },
						fmt = trun,
					},
					{
						"filename",
						padding = { left = 0, right = 0 },
						fmt = trunc(50, 18, 0, false),
						symbols = {
							modified = "[+]",
							readonly = "[-]",
							unnamed = "[No Name]",
							newfile = "[New]",
						},
					},
				},

				lualine_x = {
					{
						"diagnostics",
						separator = idiv,
						symbols = { error = "󰅙 ", warn = "󰀦 ", info = "󰋼 ", hint = "󰋗 " },
					},
					{
						"lsp_status",
						icon = "",
						separator = "",
						padding = { left = 0, right = 1 },
						symbols = { spinner = spin, done = "", separator = ", " },
						fmt = trun,
					},
				},

				lualine_y = {
					{ "filesize", color = { fg = mocha.text }, fmt = trun },
				},

				lualine_z = {
					{ "location", separator = { left = ldiv, right = rdiv } },
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
						symbols = { spinner = spin, done = "", separator = " " },
						fmt = trun,
					},
				},
				lualine_y = {},
				lualine_z = {},
			},
		})
	end,
}
