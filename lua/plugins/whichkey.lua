return {
	"folke/which-key.nvim",
	event = "VeryLazy", -- 推荐：自动懒加载
	init = function()
		vim.o.timeoutlen = 100
	end,
	opts = {
		-- 在这里加你的 which-key 配置，留空即默认
	}
}
