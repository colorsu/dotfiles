-- import nvim-treesitter plugin safely
local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
  return
end

-- configure treesitter
treesitter.setup({
  -- enable syntax highlighting
  highlight = {
    enable = true,
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  },
  -- enable indentation
  indent = {
    enable = true,
    ignore_scopes = {"string", "comment"},
  },
  -- enable autotagging (w/ nvim-ts-autotag plugin)
  autotag = { enable = true },
  -- ensure these language parsers are installed
  ensure_installed = {
    "bash",
    "lua",
    "c",
    "cpp",
    "rust",
    "toml",
    "python",
  },
  -- auto install above language parsers
  auto_install = true,
})
