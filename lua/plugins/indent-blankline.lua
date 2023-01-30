local status_ok, indent_blankline = pcall(require, "indent_blankline")
if not status_ok then
  vim.notify('indent_blankline not found!')
  return
end

require("indent_blankline").setup({})
