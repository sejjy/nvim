return {
	"lewis6991/gitsigns.nvim",

	event = "BufReadPost",

	opts = {
		on_attach = function(bufnr)
			local gitsigns = require("gitsigns")
			local function hdesc(desc)
				return { desc = "git [h]unk " .. desc, buffer = bufnr }
			end

			local function tdesc(desc)
				return { desc = "[t]oggle " .. desc, buffer = bufnr }
			end

			-- Navigation
			vim.keymap.set("n", "]c", function()
				if vim.wo.diff then
					vim.cmd.normal({ "]c", bang = true })
				else
					gitsigns.nav_hunk("next")
				end
			end, hdesc("next change"))

			vim.keymap.set("n", "[c", function()
				if vim.wo.diff then
					vim.cmd.normal({ "[c", bang = true })
				else
					gitsigns.nav_hunk("prev")
				end
			end, hdesc("previous change"))

			-- Actions
			vim.keymap.set("n", "<leader>hs", gitsigns.stage_hunk, hdesc("[s]tage"))
			vim.keymap.set("n", "<leader>hr", gitsigns.reset_hunk, hdesc("[r]eset"))

			vim.keymap.set("v", "<leader>hs", function()
				gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, hdesc("[s]tage selection"))

			vim.keymap.set("v", "<leader>hr", function()
				gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, hdesc("[r]eset selection"))

			vim.keymap.set("n", "<leader>hS", gitsigns.stage_buffer, hdesc("[S]tage buffer"))
			vim.keymap.set("n", "<leader>hR", gitsigns.reset_buffer, hdesc("[R]eset buffer"))
			vim.keymap.set("n", "<leader>hp", gitsigns.preview_hunk, hdesc("[p]review"))
			vim.keymap.set("n", "<leader>hi", gitsigns.preview_hunk_inline, hdesc("[i]nline preview"))

			vim.keymap.set("n", "<leader>hb", function()
				gitsigns.blame_line({ full = true })
			end, hdesc("[b]lame full"))

			vim.keymap.set("n", "<leader>hd", gitsigns.diffthis, hdesc("[d]iff"))
			vim.keymap.set("n", "<leader>hD", function()
				gitsigns.diffthis("~")
			end, hdesc("[D]iff against ~"))

			vim.keymap.set("n", "<leader>hQ", function()
				gitsigns.setqflist("all")
			end, hdesc("[Q]uickfix all hunks"))

			vim.keymap.set("n", "<leader>hq", gitsigns.setqflist, hdesc("[q]uickfix hunks"))

			-- Toggles
			vim.keymap.set("n", "<leader>tb", gitsigns.toggle_current_line_blame, tdesc("current line [b]lame"))
			vim.keymap.set("n", "<leader>td", gitsigns.toggle_deleted, tdesc("[d]eleted lines"))
			vim.keymap.set("n", "<leader>tw", gitsigns.toggle_word_diff, tdesc("[w]ord diff"))

			-- Text object
			vim.keymap.set({ "o", "x" }, "ih", gitsigns.select_hunk, { desc = "[i]nner [h]unk", buffer = bufnr })

			-- Initialize scrollbar.handlers.gitsigns
			-- require("scrollbar.handlers.gitsigns").setup()
		end,
	},
}
