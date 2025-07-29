return {
	"echasnovski/mini.icons",

	config = function()
		require("mini.icons").setup({
			file = {
				["init.lua"] = { glyph = "" },
				["LICENSE"] = { glyph = "󰿃", hl = "MiniIconsOrange" },
				["LICENSE.md"] = { glyph = "󰿃", hl = "MiniIconsOrange" },
				["LICENSE.txt"] = { glyph = "󰿃", hl = "MiniIconsOrange" },
				["README"] = { glyph = "󰋽", hl = "MiniIconsCyan" },
				["README.md"] = { glyph = "󰋽", hl = "MiniIconsCyan" },
				["README.txt"] = { glyph = "󰋽", hl = "MiniIconsCyan" },
				[".bashrc"] = { glyph = "" },
				[".zshrc"] = { glyph = "" },

				-- web dev
				["artisan"] = { glyph = "󰫐", hl = "MiniIconsRed" },
				["composer.lock"] = { glyph = "󰘦", hl = "MiniIconsYellow" },
				["eslint.config.js"] = { glyph = "󰱺", hl = "MiniIconsPurple" },
				["favicon.ico"] = { glyph = "", hl = "MiniIconsYellow" },
				[".htaccess"] = { glyph = "" },
				["package.json"] = { glyph = "󰎙", hl = "MiniIconsGreen" },
				["package-lock.json"] = { glyph = "", hl = "MiniIconsRed" },
				["robots.txt"] = { glyph = "󱚠", hl = "MiniIconsPurple" },
				["tsconfig.json"] = { glyph = "󰛦", hl = "MiniIconsBlue" },
				["vite.config.ts"] = { glyph = "", hl = "MiniIconsPurple" },
				[".env"] = { glyph = "" },
				[".env.example"] = { glyph = "" },
				[".prettierrc"] = { glyph = "", hl = "MiniIconsOrange" },
			},

			filetype = {
				["awk"] = { glyph = "", hl = "MiniIconsGreen" },
				["bash"] = { glyph = "", hl = "MiniIconsGreen" },
				["conf"] = { glyph = "" },
				["config"] = { glyph = "" },
				["css"] = { glyph = "", hl = "MiniIconsPurple" },
				["csv"] = { glyph = "󱎏", hl = "MiniIconsGreen" },
				["editorconfig"] = { glyph = "" },
				["html"] = { glyph = "󰗀" },
				["rasi"] = { glyph = "", hl = "MiniIconsPurple" },
				["sh"] = { glyph = "", hl = "MiniIconsGreen" },
				["tmux"] = { glyph = "" },
				["zsh"] = { glyph = "", hl = "MiniIconsGreen" },
			},
		})

		-- mock nvim-web-devicons to use mini.icons instead
		require("mini.icons").mock_nvim_web_devicons()
	end,
}
