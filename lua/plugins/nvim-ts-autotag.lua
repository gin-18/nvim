local status_ok, nvim_ts_autotag = pcall(require, "nvim-ts-autotag")
if not status_ok then
  vim.notify("nvim-ts-autotag not found!")
  return
end

nvim_ts_autotag.setup()
