local status_ok, mason = pcall(require, 'mason')
if not status_ok then
  vim.notify('mason not found!')
  return
end

mason.setup({
  ui = {
    border = 'rounded',
    icons = {
      package_installed = '',
      package_pending = '',
      package_uninstalled = ''
    }
  }
})
