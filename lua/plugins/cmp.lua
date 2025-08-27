return {
	"saghen/blink.cmp",

	dependencies = { "rafamadriz/friendly-snippets" },

	version = "1.*",

	opts = {
		keymap = {
			preset = "default",
		},
		appearance = {
			nerd_font_variant = "mono",
			kind_icons = {
				Text = " ",
				Method = " ",
				Function = " ",
				Constructor = " ",
				Field = " ",
				Variable = " ",
				Class = " ",
				Interface = " ",
				Module = " ",
				Property = " ",
				Unit = " ",
				Value = " ",
				Enum = " ",
				Keyword = " ",
				Snippet = " ",
				Color = " ",
				File = " ",
				Reference = " ",
				Folder = " ",
				EnumMember = " ",
				Constant = " ",
				Struct = " ",
				Event = " ",
				Operator = " ",
				TypeParameter = " ",
			},
		},
		completion = {
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 50,
				update_delay_ms = 50,
			},
			menu = {
				draw = {
					align_to = "cursor",
					columns = {
						{
							"label",
							"label_description",
							gap = 1,
						},
						{
							"kind_icon",
							"kind",
						},
					},
				},
			},
		},
		sources = {
			default = {
				"lsp",
				"path",
				"snippets",
				"buffer",
			},
			providers = {
				lsp = { fallbacks = {} },
				path = {
					opts = {
						get_cwd = function(_)
							return vim.fn.getcwd()
						end,
					},
				},
			},
		},
		cmdline = {
			enabled = true,
			sources = { "cmdline" },
			completion = {
				menu = {
					auto_show = true,
				},
			},
		},
		fuzzy = {
			implementation = "prefer_rust_with_warning",
		},
	},

	opts_extend = { "sources.default" },
}
