return {
	vim.diagnostic.config({
		underline = true,
		virtual_text = { prefix = "💡", spacing = 4 },
		signs = true,
		float = {
			border = "rounded",
			source = "always"
		},
		update_in_insert = false,
		severity_sort = true,
	})
}
