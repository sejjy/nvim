return {
	{
		"christoomey/vim-tmux-navigator",

		keys = {
			{ "<C-h>", ":<C-u>TmuxNavigateLeft<Enter>" },
			{ "<C-j>", ":<C-u>TmuxNavigateDown<Enter>" },
			{ "<C-k>", ":<C-u>TmuxNavigateUp<Enter>" },
			{ "<C-l>", ":<C-u>TmuxNavigateRight<Enter>" },
			{ "<C-\\>", ":<C-u>TmuxNavigatePrevious<Enter>" },
		},
	},

	{
		"rmagatti/auto-session",

		opts = {
			suppressed_dirs = { "/", "~/", "~/Downloads" },
			-- log_level = "debug",
		},
	},
}
