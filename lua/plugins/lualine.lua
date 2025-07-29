return {
	"nvim-lualine/lualine.nvim",

	config = function()
		--- @param trunc_width number trunctates component when screen width is less then trunc_width
		--- @param trunc_len number truncates component to trunc_len number of chars
		--- @param hide_width number hides component when window width is smaller then hide_width
		--- @param no_ellipsis boolean whether to disable adding "..." at end after truncation
		--- return function that can format the component accordingly
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

		require("lualine").setup({
			-- options = { component_separators = "" },
			options = {
				-- globalstatus = true,
				component_separators = "· ",
				section_separators = { left = "", right = "" },
				disabled_filetypes = {
					statusline = {
						"neo-tree",
						"aerial",
					},
				},
			},

			sections = {
				lualine_a = {
					{ "mode", fmt = trunc(75, 1, 0, true), separator = { left = "", right = " " } },
				},

				lualine_b = {
					-- { "b:gitsigns_head", icon = "󰘬" },
					{
						"branch",
						icon = "󰘬",
						color = { fg = mocha.text },
						separator = { left = "", right = " " },
						padding = { left = 0, right = 1 },
					},
				},

				lualine_c = {
					{
						"diff",
						fmt = trunc(0, 0, 75, true),
						symbols = { added = " ", modified = " ", removed = " " },
						diff_color = {
							modified = { fg = mocha.blue }, -- Changes the diff's modified color
						},
						padding = { left = 0, right = 1 },
					},
					{
						"filetype",
						fmt = trunc(0, 0, 75, true),
						icon_only = true,
						separator = "",
						padding = { left = 0, right = 0 },
					},
					{
						"filename",
						fmt = trunc(50, 18, 0, false),
						padding = { left = 0, right = 0 },
						symbols = {
							modified = "[+]", -- Text to show when the file is modified.
							readonly = "[-]", -- Text to show when the file is non-modifiable or readonly.
							unnamed = "[No Name]", -- Text to show for unnamed buffers.
							newfile = "[New]", -- Text to show for newly created file before first write
						},
					},
				},

				lualine_x = {
					{ "diagnostics", separator = "·" },
					{
						"lsp_status",
						fmt = trunc(0, 0, 75, true),
						icon = "",
						symbols = {
							spinner = { "|", "/", "—", "\\" },
							done = "",
							separator = " · ",
						},
						padding = { left = 0, right = 1 },
						separator = "",
					},
				},

				-- lualine_y = { { "progress", fmt = trunc(0, 0, 75, true) } },
				lualine_y = {
					{ "filesize", color = { fg = mocha.text }, fmt = trunc(0, 0, 75, true) },
				},

				lualine_z = {
					{ "location", separator = { left = "", right = "" } },
				},
			},

			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = {
					{
						"lsp_status",
						fmt = trunc(0, 0, 75, true),
						icon = "",
						symbols = {
							spinner = { "|", "/", "—", "\\" },
							done = "",
							separator = " ",
						},
					},
				},
				lualine_y = {},
				lualine_z = {},
			},
		})

		-- fix outer separators' bg color
		vim.api.nvim_set_hl(0, "StatusLine", { reverse = false })
		vim.api.nvim_set_hl(0, "StatusLineNC", { reverse = false })
	end,
}
