local status_ok, symbols_outline = pcall(require, 'symbols-outline')
if not status_ok then
  vim.notify('symbols-outline not found!')
  return
end

symbols_outline.setup({
  auto_close = true,
  preview_bg_highlight = 'Normal',
})
