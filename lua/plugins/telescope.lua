return { {
	"nvim-telescope/telescope.nvim",
	tag = '0.1.8',
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-live-grep-args.nvim",
		{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
		"nosduco/remote-sshfs.nvim",
	},
	config = function()
		local telescope_ok, telescope = pcall(require, "telescope")
		if not telescope_ok then
			return
		end

		local actions = require("telescope.actions")
		local lga_actions = require("telescope-live-grep-args.actions")

		telescope.setup({
			defaults = {
				path_display = { "truncate" },
				-- sorting_strategy = "ascending",
				dynamic_preview_title = true,
				mappings = {
					i = {
						["<C-n>"] = actions.cycle_history_next,
						["<C-p>"] = actions.cycle_history_prev,
						["<C-j>"] = actions.move_selection_next,
						["<C-k>"] = actions.move_selection_previous,
						["<C-c>"] = actions.close,
						["<Down>"] = actions.move_selection_next,
						["<Up>"] = actions.move_selection_previous,
						["<CR>"] = actions.select_default,
						["<C-x>"] = actions.select_horizontal,
						["<C-v>"] = actions.select_vertical,
						["<C-t>"] = actions.select_tab,
						["<C-u>"] = actions.preview_scrolling_up,
						["<C-d>"] = actions.preview_scrolling_down,
						["<PageUp>"] = actions.results_scrolling_up,
						["<PageDown>"] = actions.results_scrolling_down,
						["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
						["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
						["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
						["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
						["<C-l>"] = actions.complete_tag,
						["<C-_>"] = actions.which_key,
					},
					n = {
						["<esc>"] = actions.close,
						["<CR>"] = actions.select_default,
						["<C-x>"] = actions.select_horizontal,
						["<C-v>"] = actions.select_vertical,
						["<C-t>"] = actions.select_tab,
						["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
						["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
						["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
						["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
						["j"] = actions.move_selection_next,
						["k"] = actions.move_selection_previous,
						["H"] = actions.move_to_top,
						["M"] = actions.move_to_middle,
						["L"] = actions.move_to_bottom,
						["<Down>"] = actions.move_selection_next,
						["<Up>"] = actions.move_selection_previous,
						["gg"] = actions.move_to_top,
						["G"] = actions.move_to_bottom,
						["<C-u>"] = actions.preview_scrolling_up,
						["<C-d>"] = actions.preview_scrolling_down,
						["<PageUp>"] = actions.results_scrolling_up,
						["<PageDown>"] = actions.results_scrolling_down,
						["?"] = actions.which_key,
					},
				},
			},
			pickers = {},
			extensions = {
				live_grep_args = {
					auto_quoting = false,
					default_mappings = {},
					mappings = {
						i = {
							["<C-a>"] = lga_actions.quote_prompt(),
						},
					},
				},
				fzf = {
					fuzzy = true, -- false will only do exact matching
					override_generic_sorter = true, -- override the generic sorter
					override_file_sorter = true, -- override the file sorter
					case_mode = "smart_case", -- or "ignore_case" or "respect_case"
					-- the default case_mode is "smart_case"
				},
			},
		})

		telescope.load_extension("live_grep_args")
		telescope.load_extension("remote-sshfs")
		telescope.load_extension("fzf")

		-- 按键映射
		local builtin = require("telescope.builtin")
		local keymap = vim.keymap.set
		local opts = { noremap = true, silent = true }

		-- 各种常用快捷键
		keymap("n", "<leader>fg", function() require("telescope").extensions.live_grep_args.live_grep_args() end,
			opts)
		keymap("n", "<leader>fk", builtin.keymaps, opts)
		keymap("n", "<leader>ff", builtin.find_files, opts)
		keymap("n", "<leader>fb", builtin.buffers, opts)
		keymap("n", "<leader>fh", builtin.help_tags, opts)
		keymap("n", "<leader>fm", builtin.marks, opts)
		keymap("n", "<leader>fr", builtin.lsp_dynamic_workspace_symbols, opts)
		keymap("n", "<C-\\>s", builtin.grep_string, opts)
		keymap("n", "gR", function() builtin.grep_string({ word_match = '-w', only_sort_text = true }) end, opts)
		-- 特殊参数
		keymap("n", "<leader>mA", function()
			builtin.grep_string { shorten_path = true, word_match = '-w', only_sort_text = true, grep_open_files = false, search = '' }
		end, opts)
		keymap("n", "<leader>ma", function()
			builtin.grep_string { shorten_path = true, word_match = '-w', only_sort_text = true, grep_open_files = true, cwd = '', search = '' }
		end, opts)
	end,
} }
