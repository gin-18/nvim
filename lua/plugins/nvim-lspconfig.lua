local status_ok, lspconfig = pcall(require, 'lspconfig')
if not status_ok then
  vim.notify 'lspconfig not found!'
  return
end

-- diagnostic
vim.diagnostic.config {
  virtual_text = false,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = false,
  float = {
    border = 'rounded',
  },
}

-- set signs
local signs = {
  Error = '',
  Warn = '',
  Hint = '',
  Info = '',
}
for type, icon in pairs(signs) do
  local hl = 'DiagnosticSign' .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- autocompletion and keymap
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
local on_attach = function(client, bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', '<SPACE>gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', '<SPACE>gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<SPACE>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<SPACE>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', '<SPACE>cf', function()
    vim.lsp.buf.format { async = true }
  end, bufopts)
  vim.keymap.set('v', '<SPACE>cf', function()
    vim.lsp.buf.format { async = true }
  end, bufopts)
  if client.server_capabilities.documentHighlightProvider then
    vim.api.nvim_create_augroup('lsp_document_highlight', {
      clear = false,
    })
    vim.api.nvim_clear_autocmds {
      buffer = bufnr,
      group = 'lsp_document_highlight',
    }
    vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
      group = 'lsp_document_highlight',
      buffer = bufnr,
      callback = vim.lsp.buf.document_highlight,
    })
    vim.api.nvim_create_autocmd('CursorMoved', {
      group = 'lsp_document_highlight',
      buffer = bufnr,
      callback = vim.lsp.buf.clear_references,
    })
  end
end

local servers = {
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
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- lspconfig for each
lspconfig.lua_ls.setup {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' },
      },
    },
  },
}
require('lspconfig').volar.setup {
  filetypes = { 'javascript', 'javascriptreact', 'vue', 'json' },
  -- init_options = {
  --   typescript = {
  --     tsdk = '/home/gin/.local/share/nvim/mason/packages/typescript-language-server/node_modules/typescript/lib',
  --   },
  -- },
}
