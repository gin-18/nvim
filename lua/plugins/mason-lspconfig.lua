local status_ok, mason_lspconfig = pcall(require, 'mason-lspconfig')
if not status_ok then
  vim.notify 'mason-lspconfig not found!'
  return
end

mason_lspconfig.setup {
  ensure_installed = {
    'clangd',
    'vimls',
    'lua_ls',
    'html',
    'cssls',
    'tsserver',
    'volar',
    'jsonls',
    'emmet_ls',
    'tailwindcss',
  },
  automatic_installation = false,
}
