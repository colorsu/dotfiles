-- 导入需要使用的 API
local vim = vim
local fn = vim.fn
local api = vim.api
local keymap = vim.keymap

-- 定义函数，获取当前编辑文件的绝对路径并复制到剪切板
function copy_filepath_to_clipboard()
  -- 获取当前编辑文件的绝对路径
  local filepath = fn.expand('%:p')
  -- 将路径写入剪切板
  api.nvim_set_current_dir(fn.getcwd())
  api.nvim_command('let @+="' .. filepath .. '"')
  -- 使用 nvim-osc52 将路径写入系统剪贴板
  require('osc52').copy(filepath)
  -- 提示信息
  api.nvim_echo({{ "Path copied:" .. filepath, "Normal" }}, true, {})
end

keymap.set('n', '<Leader>fy', '<cmd>lua copy_filepath_to_clipboard()<CR>', {noremap = true, silent = true})


