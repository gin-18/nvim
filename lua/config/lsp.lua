local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap('n', '<space>lh', vim.lsp.buf.hover, opts)
keymap('n', '<space>ld', vim.lsp.buf.definition, opts)
keymap('n', '<space>lr', vim.lsp.buf.references, opts)
keymap('n', '<space>rn', vim.lsp.buf.rename, opts)
keymap('n', '<space>ca', vim.lsp.buf.code_action, opts)
