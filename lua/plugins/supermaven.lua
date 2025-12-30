return {
	"supermaven-inc/supermaven-nvim",
	event = "InsertEnter";
	config = function()
		require("supermaven-nvim").setup({
			disable_keymaps = true
		})

		-- 方便其它文件调用
		_G.SuperMavenExpand = function(fallback)
			local luasnip = require('luasnip')
			local suggestion = require('supermaven-nvim.completion_preview')

			if luasnip.expandable() then
				luasnip.expand()
			elseif suggestion.has_suggestion() then
				suggestion.on_accept_suggestion()
			else
				fallback()
			end
		end
	end,
}
