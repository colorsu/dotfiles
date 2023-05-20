local opt = vim.opt

vim.g['c_syntax_for_h'] = '1'

-- mouse
opt.mouse = "nv"

-- line numbers
opt.relativenumber = true
opt.number = true

-- Enable folding
opt.foldmethod = 'marker'

opt.colorcolumn = '80'
vim.api.nvim_set_option_value("colorcolumn", "79", {})

-- tabs & indentation
opt.tabstop = 8
opt.shiftwidth = 8
opt.softtabstop = -1
opt.expandtab = false
opt.autoindent = true
opt.smartindent = true

-- -- 打开文件类型检测
-- vim.cmd('filetype plugin indent on')
--
-- vim.api.nvim_exec([[
--   autocmd FileType c setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab=true
--   autocmd FileType cpp setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab=true
-- ]], false)
--
-- -- Rust 文件的选项
-- vim.api.nvim_exec([[
--   autocmd FileType rust setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab=true
-- ]], false)
--
-- -- Python 文件的选项
-- vim.api.nvim_exec([[
--   autocmd FileType python setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab
-- ]], false)


-- files
opt.swapfile = false
opt.autoread = true
vim.bo.autoread = true

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- cursor line
opt.cursorline = true


-- appearance
opt.termguicolors = true
opt.background = "dark"

opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"
vim.opt.list = true
vim.opt.listchars = {tab = '>-', trail = '.', extends = '>', precedes = '<'}

-- clipboard
opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true


opt.updatetime = 300
opt.timeoutlen = 500
