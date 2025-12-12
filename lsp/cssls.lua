local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

return {
  cmd = { 'vscode-css-language-server', '--stdio' },
  filetypes = { 'css', 'scss', 'less', 'html', 'vue' },
  root_markers = { 'package.json', '.git' },
  init_options = {
    {
      provideFormatter = true,
    },
  },
  settings = {
    {
      css = {
        validate = true,
      },
      less = {
        validate = true,
      },
      scss = {
        validate = true,
      },
    },
  },
}
