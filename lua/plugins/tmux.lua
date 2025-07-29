return {
	{
		"christoomey/vim-tmux-navigator",

		keys = {
			{ "<C-h>", ":<C-U>TmuxNavigateLeft<Enter>" },
			{ "<C-j>", ":<C-U>TmuxNavigateDown<Enter>" },
			{ "<C-k>", ":<C-U>TmuxNavigateUp<Enter>" },
			{ "<C-l>", ":<C-U>TmuxNavigateRight<Enter>" },
			{ "<C-\\>", ":<C-U>TmuxNavigatePrevious<Enter>" },
		},
	},

	{
		"rmagatti/auto-session",

		opts = {
			suppressed_dirs = { "/", "~/", "~/Downloads" },
			-- log_level = 'debug',
		},
	},
}
