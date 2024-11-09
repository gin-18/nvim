local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- remap space as leader key
-- vim.g.mapleader = '<space>'

-- remap
keymap('n', 's', '<cmd>w<cr>', opts)
keymap('n', 'S', '<cmd>wq<cr>', opts)
keymap({ 'n', 'v' }, 'K', '5k', opts)
keymap({ 'n', 'v' }, 'J', '5j', opts)
keymap({ 'n', 'v' }, 'H', '0', opts)
keymap({ 'n', 'v' }, 'L', '$', opts)
keymap('n', 'n', 'nzz', opts)
keymap('n', 'N', 'Nzz', opts)
keymap('n', '<space>nh', '<cmd>nohlsearch<cr>', opts)
keymap('n', '<space>ev', '<cmd>e $MYVIMRC<cr>', opts)
keymap('n', '<space>sj', '<cmd>set splitbelow<cr><cmd>split<cr>', opts)
keymap('n', '<space>sl', '<cmd>set nosplitright<cr><cmd>vsplit<cr>', opts)
keymap('n', '<space><space>', '<Esc>/<++><cr><cmd>nohlsearch<cr>c4l', opts)
keymap('n', '<space>pp', '"+p', opts)
keymap('v', '<space>yc', '"+y', opts)
