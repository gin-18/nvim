local status_ok, yanky = pcall(require, 'yanky')
if not status_ok then
  vim.notify('yanky not found!')
  return
end

yanky.setup()
