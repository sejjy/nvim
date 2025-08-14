return {
	"echasnovski/mini.icons",

	config = function()
		local bash = ""
		local css = ""
		local gear = ""
		local info = "󰋽"
		local license = ""
		local secret = ""

		local cyan = "MiniIconsCyan"
		local green = "MiniIconsGreen"
		local orange = "MiniIconsOrange"
		local purple = "MiniIconsPurple"
		local red = "MiniIconsRed"
		local yellow = "MiniIconsYellow"

		require("mini.icons").setup({
			file = {
				-- hidden
				[".bashrc"] = { glyph = gear },
				[".env"] = { glyph = secret },
				[".env.example"] = { glyph = secret },
				[".htaccess"] = { glyph = gear },
				[".prettierrc"] = { glyph = "" },
				[".zshrc"] = { glyph = gear },

				artisan = { glyph = "󰫐", hl = red },
				["composer.lock"] = { glyph = "󰘦", hl = yellow },
				["eslint.config.js"] = { glyph = "󰱺", hl = purple },
				["favicon.ico"] = { glyph = "", hl = yellow },
				["init.lua"] = { glyph = "" },

				LICENSE = { glyph = license, hl = orange },
				["LICENSE.md"] = { glyph = license, hl = orange },
				["LICENSE.txt"] = { glyph = license, hl = orange },

				["package.json"] = { glyph = "󰎙", hl = green },
				["package-lock.json"] = { glyph = "", hl = red },

				README = { glyph = info, hl = cyan },
				["README.md"] = { glyph = info, hl = cyan },
				["README.txt"] = { glyph = info, hl = cyan },

				["robots.txt"] = { glyph = "󱚠", hl = purple },
				["tsconfig.json"] = { glyph = "󰛦", hl = "MiniIconsBlue" },
				["vite.config.ts"] = { glyph = "", hl = purple },
			},

			filetype = {
				awk = { glyph = bash, hl = green },
				bash = { glyph = bash, hl = green },
				conf = { glyph = gear },
				config = { glyph = gear },
				css = { glyph = css, hl = purple },
				csv = { glyph = "󱎏", hl = green },
				editorconfig = { glyph = gear },
				html = { glyph = "󰗀" },
				man = { glyph = "󱗖" },
				rasi = { glyph = css, hl = purple },
				sh = { glyph = bash, hl = green },
				tmux = { glyph = gear },
				zsh = { glyph = bash, hl = green },
			},
		})

		-- mock nvim-web-devicons to use mini.icons instead
		require("mini.icons").mock_nvim_web_devicons()
	end,
}
