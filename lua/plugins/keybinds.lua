return {
	"folke/which-key.nvim",

	event = "VeryLazy",

	keys = {
		{
			"<Leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "local keymaps",
		},
	},

	spec = {
		{ "<Leader>c", group = "[c]ode", mode = { "n", "x" } },
		{ "<Leader>d", group = "[d]ocument" },
		{ "<Leader>r", group = "[r]ename" },
		{ "<Leader>s", group = "[s]earch" },
		{ "<Leader>t", group = "[t]oggle" },
		{ "<Leader>w", group = "[w]orkspace" },
		{ "<Leader>h", group = "git [h]unk", mode = { "n", "v" } },
	},

	opts = {
		delay = 0,

		win = { border = "single" },

		icons = {
			breadcrumb = "+",
			separator = "󰁔",
			ellipsis = "",
			mappings = false,

			keys = {
				Up = "󰁝",
				Down = "󰁅",
				Left = "󰁍",
				Right = "󰁔",
				C = "Ctrl-",
				M = "Alt-",
				D = "Super-",
				S = "Shift-",
				CR = "<Enter>",
				Esc = "󱊷",
				ScrollWheelDown = "󱕐",
				ScrollWheelUp = "󱕑",
				NL = "󰌑",
				BS = "󰭜",
				Space = "<Leader>",
				Tab = "<Tab>",
			},
		},
	},
}
