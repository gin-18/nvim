local status_ok, nvim_autopairs = pcall(require, 'nvim-autopairs')
if not status_ok then
  vim.notify('nvim-autopairs not found!')
  return
end

nvim_autopairs.setup({})
