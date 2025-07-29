vim.diagnostic.config({
	float = { source = true },
	severity_sort = true,
	underline = true,
	virtual_text = true,
	signs = {
		numhl = {
			[vim.diagnostic.severity.ERROR] = "ErrorMsg",
			[vim.diagnostic.severity.WARN] = "WarningMsg",
		},
		text = {
			[vim.diagnostic.severity.ERROR] = "󰅚 ",
			[vim.diagnostic.severity.WARN] = "󰀪 ",
			[vim.diagnostic.severity.INFO] = "󰋽 ",
			[vim.diagnostic.severity.HINT] = "󰌶 ",
		},
	},
})

vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { undercurl = true })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", { undercurl = true })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo", { undercurl = true })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint", { undercurl = true })

local function toggle_diagnostics()
	vim.diagnostic.config({
		virtual_text = not vim.diagnostic.config().virtual_text,
		underline = not vim.diagnostic.config().underline,
		signs = not vim.diagnostic.config().signs,
	})
end

vim.keymap.set("n", "<Leader>td", toggle_diagnostics, { desc = "[t]oggle [d]iagnostics" })
