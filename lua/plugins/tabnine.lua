local status_ok, tabnine = pcall(require, "tabnine")
if not status_ok then
  vim.notify("tabnine not found!")
  return
end

tabnine.setup({
  disable_auto_comment=true,
  accept_keymap="<Tab>",
  dismiss_keymap = "<C-]>",
  debounce_ms = 800,
  suggestion_color = { gui = "#51576d" },
  exclude_filetypes = {"TelescopePrompt"},
  log_file_path = nil, -- absolute path to Tabnine log file
})
