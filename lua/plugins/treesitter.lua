return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = 'master',
		build = ":TSUpdate", -- 自动编译/更新parser
		dependencies = {
			-- rainbow，context_commentstring等扩展插件可在此加入
			"hiphish/rainbow-delimiters.nvim",
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
		event = { "BufReadPost", "BufNewFile" }, -- 启动时机，推荐懒加载
		opts = {
			ensure_installed = { "c", "lua", "rust", "python", "cmake", "make" },
			sync_install = false,
			auto_install = true,
			highlight = {
				enable = true,
				disable = { "" },
				additional_vim_regex_highlighting = { 'org' },
			},
			indent = { enable = true },

			-- 如果你用 nvim-ts-rainbow2，则下面为
			rainbow = {
				enable = true,
				extended_mode = true,
				max_file_lines = nil,
			},

			-- 开启 context_commentstring 扩展（建议显式加上，见后面注释）
			ts_context_commentstring = {
				enable = true,
				enable_autocmd = false,
			},
		},
		config = function(_, opts)
			-- 优先使用git下载parser
			require("nvim-treesitter.install").prefer_git = true

			-- setup treesitter
			require("nvim-treesitter.configs").setup(opts)

			-- context_commentstring 推荐在这里加
			vim.g.skip_ts_context_commentstring_module = true -- 保证只注册一次
			require('ts_context_commentstring').setup()
		end,

	}

	-- 如果下载慢，可以尝试使用 github 下载
	--export TREE_SITTER_PARSER_URL="https://ghproxy.com/https://github.com/tree-sitter/tree-sitter-%s"
	--nvim + "TSInstall xxx"
}
