return {
	"stevearc/conform.nvim",

	event = "BufWritePre",

	keys = {
		{
			"<Leader>f",
			function()
				require("conform").format({ async = true })
			end,
			mode = "",
			desc = "[f]ormat",
		},
	},

	-- this will provide type hinting with LuaLS
	opts = {
		-- define your formatters
		formatters_by_ft = {
			c = { "clang-format" },
			css = { "prettierd" },
			html = { "prettierd" },
			javascript = { "prettierd" },
			lua = { "stylua" },
			python = { "ruff" },
		},

		-- set default options
		default_format_opts = {
			lsp_format = "fallback",
		},

		-- set up format-on-save
		-- format_on_save = { timeout_ms = 500 },

		-- customize formatters
		formatters = {
			shfmt = {
				prepend_args = { "-i", "2" },
			},
		},
	},

	init = function()
		-- if you want the formatexpr, here is the place to set it
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
}
