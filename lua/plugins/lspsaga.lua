return {
	"nvimdev/lspsaga.nvim",
	event = "LspAttach",         -- LSP 启动后再加载
	dependencies = {
		"nvim-treesitter/nvim-treesitter", -- 如有需求依赖
		"neovim/nvim-lspconfig"
	},
	config = function()
		local status_ok, lspsaga = pcall(require, "lspsaga")
		if not status_ok then
			vim.notify("lspsaga not found!")
			return
		end

		lspsaga.setup({})

		-- 按键映射
		local keymap = vim.keymap.set

		keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", { desc = "LSP Finder" })
		keymap({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>", { desc = "Code Action" })
		keymap("n", "<space>rn", "<cmd>Lspsaga rename<CR>", { desc = "Rename all occurrences" })
		-- keymap("n", "gr", "<cmd>Lspsaga rename ++project<CR>", { desc = "Rename project occurrences" })
		keymap("n", "gp", "<cmd>Lspsaga peek_definition<CR>", { desc = "Peek Definition" })
		keymap("n", "gd", "<cmd>Lspsaga goto_definition<CR>", { desc = "Goto Definition" })
		keymap("n", "<space>t", "<cmd>Lspsaga peek_type_definition<CR>", { desc = "Peek Type Def" })
		keymap("n", "gx", "<cmd>Lspsaga goto_type_definition<CR>", { desc = "Goto Type Def" })

		keymap("n", "<leader>sl", "<cmd>Lspsaga show_line_diagnostics<CR>", { desc = "Show Line Diagnostics" })
		keymap("n", "<leader>sc", "<cmd>Lspsaga show_cursor_diagnostics<CR>",
			{ desc = "Show Cursor Diagnostics" })
		keymap("n", "<leader>sb", "<cmd>Lspsaga show_buf_diagnostics<CR>", { desc = "Show Buffer Diagnostics" })

		keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { desc = "Prev Diagnostic" })
		keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", { desc = "Next Diagnostic" })

		keymap("n", "[E", function()
			require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
		end, { desc = "Prev Error Diagnostic" })

		keymap("n", "]E", function()
			require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
		end, { desc = "Next Error Diagnostic" })

		keymap("n", "<leader>o", "<cmd>Lspsaga outline<CR>", { desc = "Toggle Outline" })

		keymap("n", "<space>k", "<cmd>Lspsaga hover_doc<CR>", { desc = "Hover Doc" })
		-- 如果你希望覆盖为 fixed 位置，用下面这句
		-- keymap("n", "<space>k", "<cmd>Lspsaga hover_doc ++keep<CR>", { desc = "Hover Doc (keep)" })

		keymap("n", "<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>", { desc = "Incoming Calls" })
		keymap("n", "<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>", { desc = "Outgoing Calls" })
		keymap({ "n", "t" }, "<A-d>", "<cmd>Lspsaga term_toggle<CR>", { desc = "Lspsaga Terminal" })
	end
}
