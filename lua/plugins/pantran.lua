return {
	"potamides/pantran.nvim",
	cmd = { "Pantran" },
	event = "VeryLazy", -- 或者你可以用 "CmdlineEnter", 也可不加，pantran 很轻
	opts = {
		default_engine = "google",
		engines = {
			yandex = {
				default_source = "auto",
				default_target = "zh-CN",
			},
		},
	},

	controls = {
		mappings = {
			edit = {
				n = {
					["j"] = "gj",
					["k"] = "gk",
				},
				i = {
					["<C-y>"] = false,
					-- ["<C-a>"] = package.loaded.pantran.ui.actions.yank_close_translation
				},
			},
		},
	},
	keys = {
		-- 普通模式下，<leader>tr 触发 motion translate
		{
			"<leader>tr",
			function() require("pantran").motion_translate() end,
			mode = "n",
			desc = "Pantran: 翻译 motion（操作符模式）选中内容"
		},
		-- 普通模式下，<leader>trr 触发 motion_translate 并加 "_"
		{
			"<leader>trr",
			function() return require("pantran").motion_translate() .. "_" end,
			mode = "n",
			expr = true,
			desc = "Pantran: 翻译 motion 选定内容并加下划线"
		},
		-- 可视模式下，<leader>tr 直接翻译选区
		{
			"<leader>tr",
			function() require("pantran").motion_translate() end,
			mode = "x",
			desc = "Pantran: 翻译可视选区内容"
		},
	}
}
