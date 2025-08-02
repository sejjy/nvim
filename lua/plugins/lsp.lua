return {
	"neovim/nvim-lspconfig",

	dependencies = {
		"mason-org/mason.nvim",
		"mason-org/mason-lspconfig.nvim",
		-- "WhoIsSethDaniel/mason-tool-installer.nvim",
	},

	config = function()
		local packages = {
			"bashls",
			"clangd",
			"cssls",
			"emmet_language_server",
			"html",
			"jsonls",
			"lua_ls",
			"tailwindcss",
			"ts_ls",

			-- tools
			"clang-format",
			"eslint_d",
			"prettierd",
			"ruff",
			"shellcheck",
			"shfmt",
			"stylua",
		}

		local servers = {
			lua_ls = {
				settings = {
					Lua = {
						completion = {
							callSnippet = "Replace",
						},
						diagnostics = {
							globals = { "vim" },
							disable = { "missing-fields" },
						},
						runtime = {
							version = "LuaJIT",
						},
						workspace = {
							checkThirdParty = false,
							library = {
								vim.env.VIMRUNTIME,
								"${3rd}/busted/library",
								"${3rd}/love2d/library",
								"${3rd}/luv/library",
							},
						},
					},
				},
			},

			cssls = {
				settings = {
					css = { validate = false },
				},
			},
		}

		require("mason").setup({
			ui = {
				border = "single",
				width = 0.8,
				height = 0.8,
				icons = {
					package_installed = "",
					package_pending = "",
					package_uninstalled = "",
				},
			},
		})

		require("mason-lspconfig").setup({
			ensure_installed = packages,
		})

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

		-- 0.11 fix
		for server, srv in pairs(servers) do
			srv.capabilities = vim.tbl_deep_extend("force", {}, capabilities, srv.capabilities or {})
			vim.lsp.config(server, srv)
		end
	end,
}
