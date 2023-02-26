local status_ok, mason_lspconfig = pcall(require, 'mason-lspconfig')
if not status_ok then
  vim.notify('mason-lspconfig not found!')
  return
end

mason_lspconfig.setup({
  -- A list of servers to automatically install if they're not already installed. Example: { "rust_analyzer@nightly", "sumneko_lua" }
  ensure_installed = { 'vimls', 'lua_ls', 'html', 'cssls', 'tsserver', 'jsonls', 'emmet_ls' },
  automatic_installation = false,
})
