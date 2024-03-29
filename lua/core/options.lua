local options = {
	backup = false, -- creates a backup file
	-- clipboard = "unnamed",               -- allows neovim to access the system clipboard
	cmdheight = 1, -- more space in the neovim command line for displaying messages
	completeopt = { "menuone", "noselect" }, -- mostly just for cmp
	conceallevel = 0, -- so that `` is visible in markdown files
	fileencoding = "utf-8", -- the encoding written to a file
	hlsearch = true, -- highlight all matches on previous search pattern
	ignorecase = true, -- ignore case in search patterns
	mouse = "a", -- allow the mouse to be used in neovim
	pumheight = 10, -- pop up menu height
	showmode = false, -- we don't need to see things like -- INSERT -- anymore
	showtabline = 2, -- always show tabs
	smartcase = true, -- smart case
	smartindent = true, -- make indenting smarter again
	splitbelow = true, -- force all horizontal splits to go below current window
	splitright = true, -- force all vertical splits to go to the right of current window
	swapfile = false, -- creates a swapfile
	termguicolors = true, -- set term gui colors (most terminals support this)
	timeoutlen = 500, -- time to wait for a mapped sequence to complete (in milliseconds)
	undofile = true, -- enable persistent undo
	updatetime = 300, -- faster completion (4000ms default)
	writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
	expandtab = false, -- dont convert tabs to spaces
	shiftwidth = 8, -- the number of spaces inserted for each indentation
	tabstop = 8, -- insert 8 spaces for a tab
	softtabstop = 8,
	cursorline = true, -- highlight the current line
	number = true, -- set numbered lines
	relativenumber = false, -- set relative numbered lines
	numberwidth = 4, -- set number column width to 2 {default 4}
	signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
	wrap = false, -- display lines as one long line
	scrolloff = 8, -- is one of my fav
	sidescrolloff = 8,
	guifont = "monospace:h17", -- the font used in graphical neovim applications
	foldenable = true,
	foldmethod = manual,
	autowrite = true,
	spell = true,
	spelllang = "en_us"
}

vim.opt.shortmess:append("c")

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.cmd("set whichwrap+=<,>,[,],h,l")
vim.cmd([[set formatoptions-=cro]]) -- TODO: this doesn't seem to work

-- vim.cmd [[
--       let g:clipboard = {
--             \   'name': 'unnamedplus',
--             \   'copy': {
--             \      '+': {lines, regtype -> extend(g:, {'foo': [lines, regtype]}) },
--             \      '*': {lines, regtype -> extend(g:, {'foo': [lines, regtype]}) },
--             \    },
--             \   'paste': {
--             \      '+': {-> get(g:, 'foo', [])},
--             \      '*': {-> get(g:, 'foo', [])},
--             \   },
--             \ }
-- ]]

vim.cmd([[
  if has("autocmd")
    " auto jump the line before
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
    " Clear extra space in the line end
    autocmd BufWritePre * :%s/\s\+$//e
    " for asm read better, use with arm-syntax-vim plugin
    au BufNewFile,BufRead *.s,*.S set filetype=arm " arm = armv6/7
  endif
]])
