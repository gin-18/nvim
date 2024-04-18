local augroup = function(name)
  return vim.api.nvim_create_augroup(name, { clear = true })
end

vim.api.nvim_create_autocmd('BufReadPost', {
  group = augroup('restore_cursor_position'),
  pattern = '*',
  callback = function()
    if vim.fn.line('\'"') > 1 and vim.fn.line('\'"') <= vim.fn.line('$') then
      vim.fn.execute('normal! g\'"')
    end
  end,
})

vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  group = augroup('set_ejs_to_html'),
  pattern = '*.ejs',
  callback = function()
    vim.bo.filetype = 'html'
  end,
})
