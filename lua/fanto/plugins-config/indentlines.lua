------------------------------------
-- IDENTLINE BRACKETS CONFIGURATION
------------------------------------

vim.opt.list = true
-- Disable indent-blankline for the dashboard buffer
vim.cmd([[
  autocmd FileType dashboard let g:indent_blankline_enabled = 0
]])

require("indent_blankline").setup {
	show_current_context = true,
	show_current_context_start = true,
	show_end_of_line = true,
	buftype_exclude = { "terminal" },
  	filetype_exclude = { "dashboard", "dashboard-nvim" }
}

