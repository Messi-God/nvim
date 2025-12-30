return {
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			options = {
				theme = "auto", -- 自动主题，或可显式选"tokyonight"、"gruvbox"、"catppuccin"等
				section_separators = { left = '', right = '' },
				component_separators = { left = '', right = '' },
				globalstatus = true, -- 顶部/底部全屏模式
				icons_enabled = true,
				disabled_filetypes = {},
			},
			sections = {
				lualine_a = { { "mode", fmt = function(str) return str:sub(1, 1) end } }, -- 简化模式名
				lualine_b = { "branch", "diff", "diagnostics" }, -- git分支、diff、LSP诊断
				lualine_c = {
					{
						"filename",
						file_status = true,
						path = 3, -- 1=相对路径
						color = { fg = '#040404', bg = '#b8c0ff' },
						symbols = {
							modified = '[+]',
							readonly = ' 🔒',
							unnamed  = '[No Name]',
							newfile  = '[New]',
						}
					},
				},
				lualine_x = { "encoding", "fileformat", "filetype" }, -- 文件编码、格式、类型
				lualine_y = { "progress" }, -- 滚动百分比
				-- lualine_z = { "location" }, -- 行列指示
				lualine_z = {
					"location",
					function()
						local line = vim.api.nvim_get_current_line()
						local chars = vim.fn.strdisplaywidth(line)
						local mark = ""
						if chars > 80 then
							mark = " !!"
						end
						return string.format("| width: %d%s", chars, mark)
					end
				}
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {}
			},
			-- tabline = {
			-- 	lualine_a = { 'buffers' },
			-- 	lualine_b = { 'branch' },
			-- 	lualine_c = { 'filename' },
			-- 	lualine_x = {},
			-- 	lualine_y = {},
			-- 	lualine_z = { 'tabs' }
			-- },
			extensions = { "nvim-tree", "quickfix", "fzf", "toggleterm", "lazy" }, -- 常见扩展
		},
	}
}
