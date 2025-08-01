return {
	"marchyman/virt-column.nvim",

	event = "VeryLazy",

	config = function()
		local state = {
			enabled = false,
			column = "80",
		}

		local function toggle_colorcolumn()
			if state.enabled then
				vim.wo.colorcolumn = ""
				state.enabled = false
			else
				vim.wo.colorcolumn = state.column
				state.enabled = true
			end
		end

		vim.api.nvim_create_autocmd("InsertEnter", {
			callback = function()
				if state.enabled then
					vim.w._virt_column_saved = vim.wo.colorcolumn
					vim.wo.colorcolumn = ""
				end
			end,
		})

		vim.api.nvim_create_autocmd("InsertLeave", {
			callback = function()
				if state.enabled then
					vim.wo.colorcolumn = vim.w._virt_column_saved or state.column
				end
			end,
		})

		require("virt-column").setup({
			char = "│",
		})

		vim.keymap.set("n", "<leader>cc", toggle_colorcolumn, { desc = "color [c]olumn" })
	end,
}
