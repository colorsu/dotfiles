local setup, gitsigns = pcall(require, "indent_blankline")
if not setup then
  print("no indent_blankline")
  return
end

vim.opt.list = true
vim.opt.listchars:append "space:⋅"

require("indent_blankline").setup {
	char = "|",
	use_treesitter = true,
	show_first_indent_level = true,
    -- show_current_context = true,
    -- show_current_context_start = true,
    -- space_char_blankline = " ",
    -- tab_char_start = ">>",
    -- tab_char_fill = nil,
    -- tab_char_end = nil,
	filetype_exclude = {
	  'lspinfo',
	  'packer',
	  'checkhealth',
	  'help',
	  'man',
	  'dashboard',
	  'git',
	  'markdown',
	  'text',
	  'terminal',
	  'NvimTree',
	},
	buftype_exclude = {
      'terminal',
      'nofile',
      'quickfix',
      'prompt',
    },
}
