return {
	"hrsh7th/nvim-cmp",
	event = { "InsertEnter", "CmdlineEnter" },
	dependencies = {
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-nvim-lsp",
		"saadparwaiz1/cmp_luasnip",
		"hrsh7th/cmp-nvim-lua",
		"L3MON4D3/LuaSnip",
		"rafamadriz/friendly-snippets",
		"onsails/lspkind-nvim",
		"hrsh7th/cmp-cmdline", -- 如要cmdline支持
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local lspkind = require("lspkind")

		require("luasnip.loaders.from_vscode").lazy_load()

		local check_backspace = function()
			local col = vim.fn.col('.') - 1
			return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s')
		end

		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},

			mapping = cmp.mapping.preset.insert({
				["<C-k>"] = cmp.mapping.select_prev_item(),
				["<C-j>"] = cmp.mapping.select_next_item(),
				["<C-b>"] = cmp.mapping.scroll_docs(-1),
				["<C-f>"] = cmp.mapping.scroll_docs(1),
				["<C-e>"] = cmp.mapping.abort(),
				["<C-Space>"] = cmp.mapping.complete(),
				["<CR>"] = cmp.mapping.confirm({ select = true }),
				["<Tab>"] = cmp.mapping(function(fallback)
					local has_supermaven, suggestion = pcall(require,
						'supermaven-nvim.completion_preview')
					if has_supermaven and suggestion.has_suggestion and suggestion.has_suggestion() then
						suggestion.on_accept_suggestion()
					elseif cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					elseif check_backspace() then
						fallback()
					else
						fallback()
					end
				end, { "i", "s" }),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
			}),

			formatting = {
				-- 用 lspkind 美化菜单，并带上文本
				fields = { "kind", "abbr", "menu" },
				format = lspkind.cmp_format({
					mode = "symbol_text",
					maxwidth = 50,
					ellipsis_char = "...",
				}),
			},

			sources = cmp.config.sources({
				{ name = "nvim_lsp", priority = 1000 },
				{ name = "luasnip",  priority = 750 },
				{ name = "path",     priority = 500 },
				{
					name = "buffer",
					priority = 250,
					option = {
						get_bufnrs = function()
							return vim.api
							    .nvim_list_bufs()
						end
					}
				},
				{ name = "nvim_lua" },
			}),

			confirm_opts = {
				behavior = cmp.ConfirmBehavior.Replace,
				select = true,
			},

			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered({ max_width = 60 }),
			},

			experimental = {
				ghost_text = true, -- Vim9风格的虚影智能提示，叠加在光标后
			},
		})

		-- -- Cmdline 补全，可以视情况打开
		cmp.setup.cmdline(':', {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = 'path' },
				{ name = 'cmdline' },
			}
		})
	end,
}
