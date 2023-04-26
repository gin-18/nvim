local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
  vim.notify("null-ls not found!")
  return
end

local formatting = null_ls.builtins.formatting
-- local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
  debug = false,
  sources = {
    -- formatting.prettier.with({ extra_args = { "--tab-width 4", "--no-semi", "--double-quote", } })
    formatting.prettier,
    formatting.stylua
  }
})
