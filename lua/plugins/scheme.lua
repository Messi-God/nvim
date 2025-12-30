-- Use molokai default
return {
	{
		'UtkarshVerma/molokai.nvim',
		config = function()
			vim.cmd.colorscheme('molokai')
			vim.opt.background = "dark"
		end,
	}
}
