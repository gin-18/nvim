local status_ok, indent_blankline = pcall(require, "indent_blankline")
if not status_ok then
  vim.notify("indent_blankline not found!")
  return
end

indent_blankline.setup({
  show_trailing_blankline_indent = true,
  show_current_context = true,
})
