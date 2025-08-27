return {
	"A7Lavinraj/fyler.nvim",

	config = function()
		require("fyler").setup({
			views = {
				explorer = {
					default_explorer = true,
					win = {
						kind = "float",
						kind_presets = {
							float = {
								width = "35abs",
								height = "0.9rel",
								left = "none",
								right = "0abs",
								top = "0abs",
							},
						},
					},
				},
				mappings = {
					explorer = {
						["<Leader>e"] = "CloseView",
					},
				},
			},
		})

		vim.keymap.set("n", "<Leader>e", ":Fyler<Enter>", { desc = "[e]xplorer" })
	end,
}
