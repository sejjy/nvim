return {
	"hrsh7th/nvim-cmp",

	event = { "InsertEnter", "CmdlineEnter" },

	dependencies = {
		{
			"L3MON4D3/LuaSnip",
			version = "v2.*",
			build = "make install_jsregexp",
		},
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer", -- buffer word completion
		"hrsh7th/cmp-path", -- path completion
		"hrsh7th/cmp-cmdline", -- command-line completion
	},

	config = function()
		local cmp_icons = {
			Text = " ",
			Method = " ",
			Function = " ",
			Constructor = " ",
			Field = " ",
			Variable = " ",
			Class = " ",
			Interface = " ",
			Module = " ",
			Property = " ",
			Unit = " ",
			Value = " ",
			Enum = " ",
			Keyword = " ",
			Snippet = " ",
			Color = " ",
			File = " ",
			Reference = " ",
			Folder = " ",
			EnumMember = " ",
			Constant = " ",
			Struct = " ",
			Event = " ",
			Operator = " ",
			TypeParameter = " ",
		}

		local cmp = require("cmp")
		local luasnip = require("luasnip")

		cmp.setup({
			sources = {
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
			},

			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},

			preselect = "item",

			completion = {
				-- autocomplete = false
				completeopt = "menu,menuone,noinsert",
			},

			mapping = cmp.mapping.preset.insert({
				["<C-Space>"] = cmp.mapping.complete(), -- manually trigger completion
				-- disable arrow keys
				["<Up>"] = cmp.config.disable,
				["<Down>"] = cmp.config.disable,
				-- selection
				["<C-u>"] = cmp.mapping.scroll_docs(-4),
				["<C-d>"] = cmp.mapping.scroll_docs(4),
				["<C-y>"] = cmp.mapping.confirm({ select = true }),

				-- luasnip
				-- jump to the next snippet placeholder
				["<C-f>"] = cmp.mapping(function(fallback)
					if luasnip.locally_jumpable(1) then
						luasnip.jump(1)
					else
						fallback()
					end
				end, { "i", "s" }),

				-- jump to the previous snippet placeholder
				["<C-b>"] = cmp.mapping(function(fallback)
					if luasnip.locally_jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
			}),

			formatting = {
				format = function(_, vim_item)
					vim_item.kind = (cmp_icons[vim_item.kind] or "") .. vim_item.kind
					return vim_item
				end,
			},

			window = {
				documentation = { border = "single" },
			},
		})

		-- `/` cmdline setup for search
		cmp.setup.cmdline({ "/", "?" }, {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = "buffer" },
			},
		})

		-- `:` cmdline setup for command-line
		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = "path" },
			}, {
				{ name = "cmdline" },
			}),
			matching = { disallow_symbol_nonprefix_matching = false },
		})
	end,
}
