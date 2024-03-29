local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
-- local keymap = vim.api.nvim_set_keymap -- support mapping onlys
local keymap = vim.keymap.set -- support string or function

--Remap space as leader key
--keymap("", "<Space>", "<Nop>", opts)
--vim.g.mapleader = " "
--vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- disable @q
keymap('n', 'q', '<Nop>', opts)
-- enable @q
-- keymap('n', 'q', '@q', opts)

-- Normal --
-- Better window navigation
-- keymap("n", "<C-j>", "<C-w>j", opts)
-- keymap("n", "<C-h>", "<C-w>h", opts)
-- keymap("n", "<C-k>", "<C-w>k", opts)
-- keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "qq", "<C-w>q", opts)

-- Window zoom
keymap("n", "zz", ":lua require('custom.functions').WindowZoom() <CR>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
-- keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)
-- keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)

-- Insert --
-- Press jk fast to exit insert mode
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- nvimTree
keymap("n", "<F2>", ":NvimTreeToggle<CR>", opt)
-- symbols-outline
keymap("n", "<F3>", ":SymbolsOutline<CR>", opt)

keymap({"v", "n"}, "<C-c>", '"+yy', opt)
keymap("n", "<C-p>", '"+p', opt)

local builtin = require("telescope.builtin")
--vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
--vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
--vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
--vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
-- keymap("n", "<leader>fg", builtin.live_grep, opt)
keymap("n", "<leader>fg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", opt)
keymap("n", "<leader>fk", builtin.keymaps, opt)
keymap("n", "<leader>ff", builtin.find_files, opt)
keymap("n", "<leader>fb", builtin.buffers, opt)
keymap("n", "<leader>fh", builtin.help_tags, opt)
keymap("n", "<leader>fr", builtin.lsp_dynamic_workspace_symbols, opt)
keymap(
	"n",
	"<leader>mA",
	":lua require('telescope.builtin').grep_string{shorten_path = true, word_match = '-w', only_sort_text = true, grep_open_files = false, search = '' }<CR>",
	opt
)
keymap(
	"n",
	"<leader>ma",
	":lua require('telescope.builtin').grep_string{shorten_path = true, word_match = '-w', only_sort_text = true, grep_open_files = true, search = '' }<CR>",
	opt
)
keymap("n", "<C-\\>s", builtin.grep_string, opt)
keymap("n", "gR", ":lua require('telescope.builtin').grep_string{word_match = '-w', only_sort_text = true }<CR>", opt)

-- bufferline
-- keymap('n', '<leader>1', ":BufferLineCyclePrev<CR>", bufferlien_opt)
-- keymap('n', '<leader>2', ":BufferLineCycleNext<CR>", bufferlien_opt)

-- Mappings.
-- See `:help vim.lsp.*` for documentation on any of the below functions
local bufopts = { noremap = true, silent = true, buffer = bufnr }
keymap("n", "gD", vim.lsp.buf.declaration, bufopts)
keymap("n", "gd", vim.lsp.buf.definition, bufopts)
keymap("n", "<space>k", vim.lsp.buf.hover, bufopts)
keymap("n", "gi", vim.lsp.buf.implementation, bufopts)
-- keymap('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
keymap("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
keymap("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
keymap("n", "<space>wl", function()
	print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, bufopts)
keymap("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
keymap("n", "<space>rn", vim.lsp.buf.rename, bufopts)
keymap("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
keymap("n", "gr", vim.lsp.buf.references, bufopts)
keymap("n", "gc", vim.lsp.buf.outgoing_calls, bufopts)
keymap("n", "<space>ft", vim.lsp.buf.format, bufopts)

-- require ("pantran")
-- vim.keymap.set("n", "<leader>tr", pantran.motion_translate, opt)
-- vim.keymap.set("n", "<leader>trr", function() return pantran.motion_translate() .. "_" end, opt)
-- vim.keymap.set("x", "<leader>tr", pantran.motion_translate, opts)
--
keymap("n", "<leader>t", ":TranslateW<CR>", opt)
keymap("v", "<leader>t", ":TranslateW<CR>", opt)

-- Hop
keymap("n", "<leader>s", ":HopChar2<CR>", opt)

keymap('n', '<F5>', function() require('dap').continue() end)
keymap('n', '<F10>', function() require('dap').step_over() end)
keymap('n', '<F7>', function() require('dap').step_into() end)
keymap('n', '<F8>', function() require('dap').step_out() end)
keymap('n', '<Leader>b', function() require('dap').toggle_breakpoint() end)
keymap('n', '<Leader>B', function() require('dap').set_breakpoint() end)
keymap('n', '<Leader>lp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
keymap('n', '<Leader>dr', function() require('dap').repl.open() end)
keymap('n', '<Leader>dl', function() require('dap').run_last() end)
keymap({'n', 'v'}, '<Leader>dh', function()
  require('dap.ui.widgets').hover()
end)
keymap({'n', 'v'}, '<Leader>dp', function()
  require('dap.ui.widgets').preview()
end)
keymap('n', '<Leader>df', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.frames)
end)
keymap('n', '<Leader>ds', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.scopes)
end)
