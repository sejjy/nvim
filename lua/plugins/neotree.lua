return {
	"nvim-neo-tree/neo-tree.nvim",

	branch = "v3.x",

	dependencies = { "MunifTanjim/nui.nvim" },

	keys = {
		{ "<Leader>e", ":Neotree reveal<Enter>", desc = "[e]xplorer", silent = true },
	},

	config = function()
		require("neo-tree").setup({
			event_handlers = {
				{
					event = "file_open_requested",
					handler = function()
						-- auto close
						-- vim.cmd("Neotree close")
						-- OR
						require("neo-tree.command").execute({ action = "close" })
					end,
				},
			},

			close_if_last_window = true,
			popup_border_style = "single",

			filesystem = {
				scan_mode = "deep",
				window = {
					position = "right",
					width = 35,
					mappings = {
						["<A-e>"] = "close_window",
					},
				},
			},

			default_component_configs = {
				container = {
					enable_character_fade = true,
					right_padding = 1,
				},

				indent = {
					padding = 0, -- extra padding on left hand side
				},

				icon = {
					folder_closed = "",
					folder_open = "",
					folder_empty = "",
					folder_empty_open = "",
					default = "",
					highlight = "NeoTreeFileIcon",
				},

				git_status = {
					symbols = {
						-- change type
						added = "",
						deleted = "",
						modified = "",
						renamed = "󰑕",

						-- status type
						untracked = "󰋖",
						ignored = "󱋭",
						unstaged = "󰄱",
						staged = "󰱒",
						conflict = "󰘭",
					},

					align = "right",
				},
			},
		})
	end,
}
