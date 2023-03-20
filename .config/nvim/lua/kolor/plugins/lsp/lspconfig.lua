-- import lspconfig plugin safely
local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
  print("no lspconfig")
  return
end

-- import cmp-nvim-lsp plugin safely
local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
  print("no cmp_nvim_lsp")
  return
end

local keymap = vim.keymap -- for conciseness

-- enable keybinds only for when lsp server available
local on_attach = function(client, bufnr)
  -- keybind options
  local opts = { noremap = true, silent = true, buffer = bufnr }

  -- set keybinds
  keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts) -- show definition, references
  keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts) -- got to declaration
  keymap.set('n', 'gd', '<cmd>Telescope lsp_definitions<cr>', opts)
  -- keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts) -- see definition and make edits in window
  keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- go to implementation
  keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions
  keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename
  keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show  diagnostics for line
  keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
  keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
  keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
  keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor
  keymap.set("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", opts) -- see outline on right hand side
  keymap.set("n", "FF", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

  -- typescript specific keymaps (e.g. rename file and update imports)
  if client.name == "tsserver" then
    keymap.set("n", "<leader>rf", ":TypescriptRenameFile<CR>") -- rename file and update imports
    keymap.set("n", "<leader>oi", ":TypescriptOrganizeImports<CR>") -- organize imports (not in youtube nvim video)
    keymap.set("n", "<leader>ru", ":TypescriptRemoveUnused<CR>") -- remove unused variables (not in youtube nvim video)
  end
end

require('lspconfig')['pyright'].setup{
  on_attach = on_attach,
  flags = {
    debounce_text_changes = 150,
  }
}
local cmp_capabilities = require("cmp_nvim_lsp").default_capabilities()

local clangd_capabilities = cmp_capabilities
clangd_capabilities.textDocument.semanticHighlighting = true
clangd_capabilities.offsetEncoding = "utf-8"

-- require("lspconfig")["clangd"].setup({
-- 	on_attach = on_attach,
-- 	capabilities = clangd_capabilities,
-- 	cmd = {
-- 		"clangd",
-- 		"--background-index",
-- 		"--pch-storage=memory",
-- 		"--clang-tidy",
-- 		"--suggest-missing-includes",
-- 		"--cross-file-rename",
-- 		"--completion-style=detailed",
-- 	},
-- 	init_options = {
--     	clangdFileStatus = true,
-- 		usePlaceholders = true,
-- 		completeUnimported = true,
-- 		semanticHighlighting = true,
-- 	},
-- 	-- flags = {
-- 	-- 	debounce_text_changes = 150,
-- 	-- }
--
-- })
local lspconfig = require'lspconfig'
lspconfig.ccls.setup {
  on_attach = on_attach,
  init_options = {
    compilationDatabaseDirectory = "./";
    index = {
      threads = 0;
    };
  }
}

require('lspconfig')['rust_analyzer'].setup{
  flags = lsp_flags,
  -- Server-specific settings...
  settings = {
    ["rust-analyzer"] = {}
  }
}

-- Change the Diagnostic symbols in the sign column (gutter)
-- (not in youtube nvim video)
local signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

