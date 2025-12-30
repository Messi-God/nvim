return {
	"windwp/nvim-autopairs",
	event = "InsertEnter", -- 推荐懒加载事件，输入时自动加载
	dependencies = {
		"hrsh7th/nvim-cmp", -- 你用到了 cmp 自动补全联动
	},
	config = function()
		local status, autopairs = pcall(require, "nvim-autopairs")
		if not status then
			vim.notify("没有找到 nvim-autopairs")
			return
		end

		autopairs.setup({
			check_ts = true,
			ts_config = {
				lua = { "string" },
				javascript = { "template_string" },
				java = false,
			},
		})
		-- cmp 配合
		local cmp_status, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")
		local cmp_ok, cmp = pcall(require, "cmp")
		if cmp_status and cmp_ok then
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({
				map_char = { tex = "" }
			}))
		end
	end
}
