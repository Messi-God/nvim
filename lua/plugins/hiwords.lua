return {
	"dvoytik/hi-my-words.nvim",
	lazy = true,
	keys = {
		{ "<Leader>k", ":HiMyWordsToggle<CR>", mode = "n", desc = "Toggle hi-my-words" },
		{ "<Leader>K", ":HiMyWordsClear<CR>",  mode = "n", desc = "Clear hi-my-words" },
	},
	config = function()
		require("hi-my-words").setup({
			silent = false,
			hl_grps = {
				{
					"HiMyWordsHLG0",
					{ ctermfg = 0, ctermbg = 11, fg = "#101820", bg = "#fee715", bold = true, italic = true },
				},
				{
					"HiMyWordsHLG1",
					{ ctermfg = 236, ctermbg = 120, fg = "#2d2d2d", bg = "#b8e994", bold = true, italic = true },
				},
				{
					"HiMyWordsHLG2",
					{ ctermfg = 15, ctermbg = 45, fg = "#FFFFFF", bg = "#00f5d4", bold = true, italic = true },
				},
				{
					"HiMyWordsHLG3",
					{ ctermfg = 0, ctermbg = 11, fg = "#e2d1f9", bg = "#2a9d8f", bold = true, italic = true },
				},
				{
					"HiMyWordsHLG4",
					{ ctermfg = 15, ctermbg = 1, fg = "#ffffff", bg = "#8aaae5", bold = true, italic = true },
				},
				{
					"HiMyWordsHLG5",
					{ ctermfg = 15, ctermbg = 1, fg = "#fcf6f5", bg = "#e9c46a", bold = true, italic = true },
				},
				{
					"HiMyWordsHLG6",
					{ ctermfg = 0, ctermbg = 11, fg = "#2f3c7e", bg = "#fbeaeb", bold = true, italic = true },
				},
				{
					"HiMyWordsHLG7",
					{ ctermfg = 0, ctermbg = 11, fg = "#408ec6", bg = "#f4a261", bold = true, italic = true },
				},
				{
					"HiMyWordsHLG8",
					{ ctermfg = 15, ctermbg = 1, fg = "#990011", bg = "#e76f51", bold = true, italic = true },
				},
				{
					"HiMyWordsHLG9",
					{ ctermfg = 0, ctermbg = 11, fg = "#2c5f2d", bg = "#ffafcc", bold = true, italic = true },
				},
			},
		})
	end
}
