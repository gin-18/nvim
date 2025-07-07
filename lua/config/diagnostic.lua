local icons = require('config.icons').diagnostic_icons
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap('n', '<space>dp', function()
  vim.diagnostic.jump({ count = 1 })
end, opts)

keymap('n', '<space>dn', function()
  vim.diagnostic.jump({ count = -1 })
end, opts)

keymap('n', '<space>dt', function()
  vim.diagnostic.open_float()
end, opts)

vim.diagnostic.config({
  float = { border = 'rounded' },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = icons.error,
      [vim.diagnostic.severity.WARN] = icons.warn,
      [vim.diagnostic.severity.INFO] = icons.info,
      [vim.diagnostic.severity.HINT] = icons.hint,
    },
  },
})
