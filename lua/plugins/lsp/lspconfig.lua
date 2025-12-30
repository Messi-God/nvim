return {
	"neovim/nvim-lspconfig",
	dependencies = {
		-- Mason相关
		{ "williamboman/mason.nvim", opts = {} }, -- 用最新官方的 mason
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		-- LSP状态提示
		{ "j-hui/fidget.nvim",       opts = {} },
	},

	-- after = "mason-lspconfig.nvim",
	config = function()
		-- Mason自动管理LSP部分（可按你自己的写法扩展）
		require("mason").setup()
		require("mason-lspconfig").setup({
			-- ensure_installed = { "lua_ls", "pyright" } --
			automatic_enable = true,
		})

		-- LSP主映射 on_attach
		local keymap = vim.keymap.set
		local keyunmap = vim.keymap.del
		local bufopts = { noremap = true, silent = true, buffer = bufnr }

		keyunmap("n", "grr", bufopts)
		keyunmap("n", "gri", bufopts)
		keyunmap("n", "gra", bufopts)
		keyunmap("n", "grn", bufopts)
		keyunmap("n", "grt", bufopts)

		keymap("n", "gD", vim.lsp.buf.declaration, bufopts)
		keymap("n", "gd", vim.lsp.buf.definition, bufopts)
		-- keymap("n", "<space>k", vim.lsp.buf.hover, bufopts)
		keymap("n", "gi", vim.lsp.buf.implementation, bufopts)
		-- keymap('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
		keymap("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
		keymap("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
		keymap("n", "<space>wl", function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end,
			bufopts)
		keymap("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
		keymap("n", "<space>rn", vim.lsp.buf.rename, bufopts)
		keymap("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
		keymap("n", "gr", vim.lsp.buf.references, bufopts)
		keymap("n", "gc", vim.lsp.buf.outgoing_calls, bufopts)
		keymap("n", "<space>ft", vim.lsp.buf.format, bufopts)

		require("fidget").setup()
	end
}
