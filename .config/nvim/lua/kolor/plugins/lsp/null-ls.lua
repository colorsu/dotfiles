local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

local formatting = null_ls.builtins.formatting

local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	debug = false,
	sources = {
		-- null_ls.builtins.completion.spell,
		formatting.prettier.with({ extra_args = { "--no-semi", "--single"} }),
		formatting.clang_format,
		-- diagnostics.cpplint.with({ extra_args = { "--filter=+whitespace/tab"} }),
	},
	client_encoding = "utf-8",
})
