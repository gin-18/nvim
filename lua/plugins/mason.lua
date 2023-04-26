local status_ok, mason = pcall(require, "mason")
if not status_ok then
  vim.notify("mason not found!")
  return
end

mason.setup({
  ui = {
    border = "rounded",
    width = 0.7,
    height = 0.8,
    icons = {
      package_installed = "",
      package_pending = "",
      package_uninstalled = ""
    }
  }
})
