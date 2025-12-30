return {
	"ARM9/arm-syntax-vim",
	"arm/armls",

	dependencies = { "neovim/nvim-lspconfig" },
	config = function()
		local lspconfig = require("lspconfig")
		local configs = require("lspconfig.configs")
		configs.armls = {
			default_config = {
				cmd = { "armls" },
				root_dir = lspconfig.util.root_pattern(".git"),
				filetypes = { "asm", "s", "S" },
			},
		}
		configs.armls.setup({})
	end,
}
