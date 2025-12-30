return {
	{
		"kevinhwang91/nvim-bqf",
		ft = "qf",
		opts = {
			auto_enable = true,
			auto_resize_height = true,
			preview = {
				win_height = 25,
				win_vheight = 12,
				delay_syntax = 80,
				border = { '┏', '━', '┓', '┃', '┛', '━', '┗', '┃' },
				default = 'rounded',
				show_title = true,
				winblend = 0,
				auto_preview = true,
				-- should_preview_cb = function(bufnr, qwinid)
				-- 	local ret = true
				-- 	local bufname = vim.api.nvim_buf_get_name(bufnr)
				-- 	local fsize = vim.fn.getfsize(bufname)
				-- 	if fsize > 100 * 1024 then
				-- 		ret = false
				-- 	elseif bufname:match('^fugitive://') then
				-- 		ret = false
				-- 	end
				-- 	return ret
				-- end,
			},
			func_map = {
				drop = 'o',
				openc = 'O',
				split = '<C-s>',
				tabdrop = '<C-t>',
				tabc = '',
				ptogglemode = 'z,',
			},
			filter = {
				fzf = {
					action_for = { ['ctrl-s'] = 'split', ['ctrl-t'] = 'tab drop' },
					extra_opts = { '--bind', 'ctrl-o:toggle-all', '--prompt', '> ' }
				}
			}
		},
		config = function(_, opts)
			vim.cmd([[
				hi BqfPreviewBorder guifg=#90e0ef ctermfg=71
				hi BqfPreviewTitle guifg=#90e0ef ctermfg=71
				hi BqfPreviewThumb guibg=#90e0ef ctermbg=71
				hi link BqfPreviewRange Search
     			 ]])
			require("bqf").setup(opts)
		end
	},

	{
		"junegunn/fzf",
		build = "./install --bin",
	},

	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},

	vim.keymap.set("n", "<Leader>1", [[:vimgrep /\w\+/j % | copen<CR>]],
		{ noremap = true, silent = true, desc = "cfile | copen" }),
	vim.keymap.set("n", "<Leader>2", [[:copen<CR>]],
		{ noremap = true, silent = true, desc = "cfile | copen" }),
}
