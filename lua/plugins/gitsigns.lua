return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" }, -- 按需加载
	opts = {
		signs = {
			add = { text = "┃" },
			change = { text = "┃" },
			delete = { text = "_" },
			topdelete = { text = "‾" },
			changedelete = { text = "~" },
			untracked = { text = "┆" },
		},
		signs_staged = {
			add = { text = "┃" },
			change = { text = "┃" },
			delete = { text = "_" },
			topdelete = { text = "‾" },
			changedelete = { text = "~" },
			untracked = { text = "┆" },
		},
		signs_staged_enable = true,
		signcolumn = true,
		numhl = false,
		linehl = false,
		word_diff = false,
		watch_gitdir = {
			follow_files = true,
		},
		auto_attach = true,
		attach_to_untracked = true,
		current_line_blame = true,
		current_line_blame_opts = {
			virt_text = true,
			virt_text_pos = "eol",
			delay = 1000,
			ignore_whitespace = false,
			virt_text_priority = 100,
			use_focus = true,
		},
		current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
		sign_priority = 6,
		update_debounce = 100,
		status_formatter = nil,
		max_file_length = 40000,
		preview_config = {
			border = "single",
			style = "minimal",
			relative = "cursor",
			row = 0,
			col = 1,
		},
	},
	config = function(_, opts)
		require("gitsigns").setup(opts)

		-- 按键映射逻辑
		local gs = package.loaded.gitsigns

		local function map(mode, l, r, desc)
			vim.keymap.set(mode, l, r, { desc = desc })
		end

		-- Buffer attach 时按键映射（原on_attach内容）
		vim.api.nvim_create_autocmd("BufEnter", {
			group = vim.api.nvim_create_augroup("GitsignsLazyAttach", { clear = true }),
			callback = function(args)
				local bufnr = args.buf
				local buffer_gs = require("gitsigns")

				local function buffer_map(mode, lhs, rhs, desc)
					vim.keymap.set(mode, lhs, rhs, { desc = desc, buffer = bufnr })
				end

				buffer_map("n", "]c", function()
					if vim.wo.diff then return "]c" end
					vim.schedule(function() buffer_gs.next_hunk() end)
					return "<Ignore>"
				end, "Next hunk")

				buffer_map("n", "[c", function()
					if vim.wo.diff then return "[c" end
					vim.schedule(function() buffer_gs.prev_hunk() end)
					return "<Ignore>"
				end, "Prev hunk")

				buffer_map({ "n", "v" }, "<leader>hs", ":Gitsigns stage_hunk<CR>", "Stage hunk")
				buffer_map({ "n", "v" }, "<leader>hr", ":Gitsigns reset_hunk<CR>", "Reset hunk")
				buffer_map("n", "<leader>hS", buffer_gs.stage_buffer, "Stage buffer")
				buffer_map("n", "<leader>hu", buffer_gs.undo_stage_hunk, "Undo stage hunk")
				buffer_map("n", "<leader>hR", buffer_gs.reset_buffer, "Reset buffer")
				buffer_map("n", "<leader>hp", buffer_gs.preview_hunk, "Preview hunk")
				buffer_map("n", "<leader>hb", function() buffer_gs.blame_line({ full = true }) end,
					"Blame line (full)")
				buffer_map("n", "<leader>tb", buffer_gs.toggle_current_line_blame, "Toggle line blame")
				buffer_map("n", "<leader>hd", buffer_gs.diffthis, "Diff this")
				buffer_map("n", "<leader>hD", function() buffer_gs.diffthis("~") end,
					"Diff this (staged)")
				buffer_map("n", "<leader>td", buffer_gs.toggle_deleted, "Toggle deleted")
				buffer_map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "Select hunk")
			end,
		})
	end
}
