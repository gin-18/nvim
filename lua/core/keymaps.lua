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

-- lsp diagnostic
keymap('n', '<space>dt', vim.diagnostic.open_float, opts)
keymap('n', '<space>dp', vim.diagnostic.goto_prev, opts)
keymap('n', '<space>dn', vim.diagnostic.goto_next, opts)
keymap('n', '<space>dl', vim.diagnostic.setloclist, opts)

-- nvim-tree
keymap('n', '<space>ee', '<cmd>NvimTreeToggle<cr>', opts)

-- lazygit
keymap('n', '<space>gg', '<cmd>LazyGit<cr>', opts)

-- gitsigns - hunk
keymap('n', '<space>hl', '<cmd>Gitsigns preview_hunk<cr>', opts)
keymap('n', '<space>hn', '<cmd>Gitsigns next_hunk<cr>', opts)
keymap('n', '<space>hp', '<cmd>Gitsigns prev_hunk<cr>', opts)
keymap('n', '<space>hr', '<cmd>Gitsigns reset_hunk<cr>', opts)

-- table-mode
keymap('n', '<M-T>', '<cmd>TableModeToggle<cr>', opts)
keymap('n', '<M-R>', '<cmd>TableModeRealign<cr>', opts)
