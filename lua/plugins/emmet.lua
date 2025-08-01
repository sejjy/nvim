return {
	"mattn/emmet-vim",

	enabled = false,

	event = "InsertEnter",

	-- enable just for html
	config = function()
		vim.g.user_emmet_install_global = 0

		vim.api.nvim_create_autocmd("FileType", {
			pattern = { "html" },
			command = "EmmetInstall",
		})
	end,
}
