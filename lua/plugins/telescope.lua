return {
	"nvim-telescope/telescope.nvim",

	branch = "0.1.x",

	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
	},

	config = function()
		-- ability to focus with cursor on the preview window #2778
		local focus_preview = function(prompt_bufnr)
			local action_state = require("telescope.actions.state")
			local picker = action_state.get_current_picker(prompt_bufnr)
			local prompt_win = picker.prompt_win
			local previewer = picker.previewer
			local winid = previewer.state.winid
			local bufnr = previewer.state.bufnr

			vim.keymap.set("n", "<Tab>", function()
				vim.cmd(string.format("noautocmd lua vim.api.nvim_set_current_win(%s)", prompt_win))
			end, { buffer = bufnr })

			vim.cmd(string.format("noautocmd lua vim.api.nvim_set_current_win(%s)", winid))
			-- api.nvim_set_current_win(winid)
		end

		local actions = require("telescope.actions")
		local borders = { "─", "│", "─", "│", "┌", "┐", "┘", "└" }

		require("telescope").setup({
			defaults = {
				borderchars = borders,
				mappings = {
					i = {
						["<Esc>"] = actions.close,
						["<A-p>"] = require("telescope.actions.layout").toggle_preview,
						["<Tab>"] = focus_preview,
					},
				},
			},

			pickers = {
				find_files = { find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" } },
				buffers = {
					mappings = {
						i = { ["<C-d>"] = actions.delete_buffer + actions.move_to_top },
					},
				},
			},

			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown({}),
				},
			},
		})

		-- telescope extensions
		pcall(require("telescope").load_extension, "fzf")
		pcall(require("telescope").load_extension, "ui-select")

		local builtin = require("telescope.builtin")
		local function tdesc(desc)
			return { desc = "[s]earch " .. desc }
		end

		vim.keymap.set("n", "<Leader>sh", builtin.help_tags, tdesc("[h]elp"))
		vim.keymap.set("n", "<Leader>sk", builtin.keymaps, tdesc("[k]eymaps"))
		vim.keymap.set("n", "<Leader>sf", builtin.find_files, tdesc("[f]iles"))
		vim.keymap.set("n", "<Leader>ss", builtin.builtin, tdesc("[s]elect Telescope"))
		vim.keymap.set("n", "<Leader>sw", builtin.grep_string, tdesc("current [w]ord"))
		vim.keymap.set("n", "<Leader>sg", builtin.live_grep, tdesc("by [g]rep"))
		vim.keymap.set("n", "<Leader>sd", builtin.diagnostics, tdesc("[d]iagnostics"))
		vim.keymap.set("n", "<Leader>sr", builtin.resume, tdesc("[r]esume"))
		vim.keymap.set("n", "<Leader>s.", builtin.oldfiles, tdesc("[.] all recent files"))

		vim.keymap.set("n", "<Leader><leader>", builtin.buffers, { desc = "find buffers" })

		vim.keymap.set("n", "<Leader>/", function()
			builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
				previewer = false,
				borderchars = borders,
			}))
		end, { desc = "fuzzy search in buffer" })

		vim.keymap.set("n", "<Leader>s/", function()
			builtin.live_grep({
				grep_open_files = true,
				prompt_title = "Live Grep in Open Files",
			})
		end, { desc = "[s]earch [/] in open files" })

		vim.keymap.set("n", "<Leader>sn", function()
			builtin.find_files({ cwd = vim.fn.stdpath("config") })
		end, { desc = "[s]earch [n]eovim files" })
	end,
}
