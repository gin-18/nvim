require('conform').setup {
  formatters_by_ft = {
    lua = { 'stylua' },
    javascript = { { 'prettier', 'prettierd' } },
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
}
