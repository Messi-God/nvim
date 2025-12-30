return {
	"phaazon/hop.nvim",

	opts = { noremap = true, silent = true },
	vim.keymap.set("n", "<leader>s", ":HopChar2<CR>", opts)
}
