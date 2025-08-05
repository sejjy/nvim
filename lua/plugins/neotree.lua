return {
	"nvim-neo-tree/neo-tree.nvim",

	branch = "v3.x",

	dependencies = { "MunifTanjim/nui.nvim" },

	keys = {
		{ "<A-e>", ":Neotree reveal<Enter>", desc = "[e]xplorer", silent = true },
	},

	config = function()
		require("neo-tree").setup({
			event_handlers = {
				{
					event = "file_open_requested",
					handler = function()
						require("neo-tree.command").execute({ action = "close" })
					end,
				},
				--[[
				-- enable preview by default
				{
					event = "after_render",
					handler = function()
						local state = require("neo-tree.sources.manager").get_state("filesystem")
						if not require("neo-tree.sources.common.preview").is_active() then
							state.config = { use_float = true }
							state.commands.toggle_preview(state)
						end
					end,
				},
				--]]
			},

			close_if_last_window = true,
			popup_border_style = "single",

			filesystem = {
				scan_mode = "deep",

				window = {
					position = "float",
					width = 35,

					popup = {
						size = { height = "30", width = "78" },
						position = "50%",
					},

					mappings = {
						["<A-e>"] = "close_window",
						["P"] = "",
						["<A-p>"] = { "toggle_preview", config = { use_float = true } },
						["<esc>"] = "",
						["<Esc>"] = "close_window",
						["[g"] = "",
						["]g"] = "",
						["[c"] = "prev_git_modified",
						["]c"] = "next_git_modified",
					},
				},
			},

			default_component_configs = {
				container = {
					enable_character_fade = true,
					right_padding = 0,
				},

				indent = {
					indent_size = 2,
					padding = 2, -- extra padding on left hand side
					with_expanders = true,
					expander_collapsed = "",
					expander_expanded = "",
				},

				icon = {
					folder_closed = "",
					folder_open = "",
					folder_empty = "",
					folder_empty_open = "",
					default = "",
				},

				git_status = {
					symbols = {
						-- change type
						added = "+",
						deleted = "-",
						modified = "~",
						renamed = "~",

						-- status type
						untracked = "󰋖",
						ignored = "󱋯",
						unstaged = "󰝣",
						staged = "󰝤",
						conflict = "󰅖",
					},

					align = "right",
				},
			},
		})

		local mocha = require("catppuccin.palettes").get_palette("mocha")

		vim.api.nvim_set_hl(0, "NeoTreeFloatTitle", { fg = mocha.blue })
	end,
}
