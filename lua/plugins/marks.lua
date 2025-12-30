return {
	"chentoast/marks.nvim",
	event = "VeryLazy",
	opts = {},

	keys = {
		{
			"<leader>mQ",
			function()
				-- 调用插件提供的命令来列出所有全局 Marks 到 Quickfix
				vim.cmd("MarksQFListGlobal")
				-- 或者，如果需要当前缓冲区 Marks，可以使用 :MarksQFListBuf
			end,
			desc = "Marks: List All Global Marks to Quickfix",
		},
		{
			"<leader>mq",
			function()
				-- 调用插件提供的命令来列出当前buffer Marks 到 Quickfix
				vim.cmd("MarksQFListBuf")
				-- 或者，如果需要当前缓冲区 Marks，可以使用 :MarksQFListBuf
			end,
			desc = "Marks: List Buffer Marks to Quickfix",
		},
		-- not working now
		{
			"<leader>ma",
			function()
				-- 调用 marks.nvim 提供的内置 Lua 函数
				require("marks").annotate()
			end,
			desc = "Marks: Annotate Bookmark (添加书签注释)",
		},
	},

	-- not working now
	-- vim.api.nvim_set_hl(
	-- 	0, -- 0 表示设置全局高亮组
	-- 	"MarkSignHL", -- 例如 "MarkSignHL"
	-- 	{ fg = "#RRGGBB", bg = "#RRGGBB", style = "bold, italic, underline" }
	-- )
}
