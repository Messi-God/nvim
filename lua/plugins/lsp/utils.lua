return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},

	config = function()
		local null_ls = require("null-ls")

	local formatting = null_ls.builtins.formatting
	local diagnostics = null_ls.builtins.diagnostics
	null_ls.setup({
		sources = {
		formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
		formatting.black.with({ extra_args = { "--fast" , "--line-length=80" } }),
		-- formatting.stylua,
		formatting.clang_format,
		formatting.cmake_format,
		formatting.shfmt, -- shell script formatting
		diagnostics.cmake_lint, -- cmake lint
		diagnostics.checkmake, -- make lint
		diagnostics.codespell,
		diagnostics.commitlint,
		diagnostics.gitlint,
		diagnostics.pylint, -- python lint
		-- diagnostics.cppcheck,
		-- diagnostics.gccdiag,
		null_ls.builtins.completion.spell,
		null_ls.builtins.completion.luasnip,
		null_ls.builtins.completion.nvim_snippets,
		null_ls.builtins.completion.tags,
		null_ls.builtins.hover.dictionary,
		},
	})
	end
}
