return {
	"echasnovski/mini.icons",

	config = function()
		local blue = "MiniIconsBlue"
		local cyan = "MiniIconsCyan"
		local green = "MiniIconsGreen"
		local orange = "MiniIconsOrange"
		local purple = "MiniIconsPurple"
		local red = "MiniIconsRed"
		local yellow = "MiniIconsYellow"

		require("mini.icons").setup({
			file = {
				-- hidden
				[".bashrc"] = { glyph = "" },
				[".env"] = { glyph = "" },
				[".env.example"] = { glyph = "" },
				[".htaccess"] = { glyph = "" },
				[".prettierrc"] = { glyph = "" },
				[".zshrc"] = { glyph = "" },

				artisan = { glyph = "󰫐", hl = red },
				["composer.lock"] = { glyph = "󰘦", hl = yellow },
				["eslint.config.js"] = { glyph = "󰱺", hl = purple },
				["favicon.ico"] = { glyph = "", hl = yellow },
				["init.lua"] = { glyph = "" },

				LICENSE = { glyph = "󰿃", hl = orange },
				["LICENSE.md"] = { glyph = "󰿃", hl = orange },
				["LICENSE.txt"] = { glyph = "󰿃", hl = orange },

				["package.json"] = { glyph = "󰎙", hl = green },
				["package-lock.json"] = { glyph = "", hl = red },

				README = { glyph = "󰋽", hl = cyan },
				["README.md"] = { glyph = "󰋽", hl = cyan },
				["README.txt"] = { glyph = "󰋽", hl = cyan },

				["robots.txt"] = { glyph = "󱚠", hl = purple },
				["tsconfig.json"] = { glyph = "󰛦", hl = blue },
				["vite.config.ts"] = { glyph = "", hl = purple },
			},

			filetype = {
				awk = { glyph = "", hl = green },
				bash = { glyph = "", hl = green },
				conf = { glyph = "" },
				config = { glyph = "" },
				css = { glyph = "", hl = purple },
				csv = { glyph = "󱎏", hl = green },
				editorconfig = { glyph = "" },
				html = { glyph = "󰗀" },
				rasi = { glyph = "", hl = purple },
				sh = { glyph = "", hl = green },
				tmux = { glyph = "" },
				zsh = { glyph = "", hl = green },
			},
		})

		-- mock nvim-web-devicons to use mini.icons instead
		require("mini.icons").mock_nvim_web_devicons()
	end,
}
