local opts = { noremap = true, silent = true }

local keymap = vim.keymap.set

-- remap space as leader key
-- vim.g.mapleader = '<SPACE>'

-- remap
keymap('n', 's', '<Cmd>w<CR>', opts)
keymap('n', 'S', '<Cmd>wq<CR>', opts)
keymap('n', 'Q', '<Cmd>q<CR>', opts)
keymap('n', 'K', '5k', opts)
keymap('n', 'J', '5j', opts)
keymap('n', 'H', '0', opts)
keymap('n', 'L', '$', opts)
keymap('n', 'n', 'nzz', opts)
keymap('n', 'N', 'Nzz', opts)
keymap('n', '<M-H>', '<C-w>h', opts)
keymap('n', '<M-J>', '<C-w>j', opts)
keymap('n', '<M-K>', '<C-w>k', opts)
keymap('n', '<M-L>', '<C-w>l', opts)
keymap('n', '<SPACE>nh', '<Cmd>nohlsearch<CR>', opts)
keymap('n', '<SPACE>ev', '<Cmd>e $MYVIMRC<CR>', opts)
keymap('n', '<SPACE>sj', '<Cmd>set splitbelow<CR><Cmd>split<CR>', opts)
keymap('n', '<SPACE>sl', '<Cmd>set nosplitright<CR><Cmd>vsplit<CR>', opts)
keymap('n', '<S-UP>', '<Cmd>res +5<CR>', opts)
keymap('n', '<S-DOWN>', '<Cmd>res -5<CR>', opts)
keymap('n', '<S-LEFT>', '<Cmd>vertical resize+5<CR>', opts)
keymap('n', '<S-RIGHT', '<Cmd>vertical resize-5<CR>', opts)
keymap('n', '<SPACE><SPACE>', '<Esc>/<++><CR><Cmd>nohlsearch<CR>c4l', opts)
keymap('n', '<SPACE>pp', '"+p', opts)
keymap('v', 'K', '5k', opts)
keymap('v', 'J', '5j', opts)
keymap('v', 'H', '0', opts)
keymap('v', 'L', '$', opts)
keymap('v', '<SPACE>yy', '"+y', opts)

-- lsp diagnostic
keymap('n', '<SPACE>dt', vim.diagnostic.open_float, opts)
keymap('n', '<SPACE>dp', vim.diagnostic.goto_prev, opts)
keymap('n', '<SPACE>dn', vim.diagnostic.goto_next, opts)
keymap('n', '<SPACE>dl', vim.diagnostic.setloclist, opts)

-- telescope
keymap('n', '<SPACE>tf', '<Cmd>Telescope find_files<CR>', opts)
keymap('n', '<SPACE>th', '<Cmd>Telescope find_files search_dirs=~<CR>', opts)
keymap('n', '<SPACE>tg', '<Cmd>Telescope git_files<CR>', opts)
keymap('n', '<SPACE>to', '<Cmd>Telescope oldfiles<CR>', opts)
keymap('n', '<SPACE>tb', '<Cmd>Telescope buffers<CR>', opts)
keymap('n', '<SPACE>tl', '<Cmd>Telescope live_grep<CR>', opts)
keymap('n', '<SPACE>ty', '<Cmd>Telescope yank_history<CR>', opts)
keymap('n', '<SPACE>td', '<Cmd>Telescope diagnostics<CR>', opts)
keymap('n', '<SPACE>tp', '<Cmd>Telescope projects<CR>', opts)

-- nvim-tree
keymap('n', '<SPACE>ee', '<Cmd>NvimTreeToggle<CR>', opts)

-- lazygit
keymap('n', '<SPACE>gg', '<Cmd>LazyGit<CR>', opts)

-- gitsigns
keymap('n', '<SPACE>gp', '<Cmd>Gitsigns preview_hunk<CR>', opts)

-- symbols-outine
keymap('n', '<SPACE>st', '<Cmd>SymbolsOutline<CR>', opts)

-- floaterm
keymap('n', '<SPACE>ft', '<Cmd>FloatermToggle<CR>', opts)
keymap('n', '<SPACE>fn', '<Cmd>FloatermNew<CR>', opts)
keymap('n', '<SPACE>fk', '<Cmd>FloatermKill!<CR>', opts)
keymap('t', '<M-t>', '<C-\\><C-n><Cmd>FloatermToggle<CR>', opts)
keymap('t', '<M-n>', '<C-\\><C-n><Cmd>FloatermNext<CR>', opts)
keymap('t', '<M-p>', '<C-\\><C-n><Cmd>FloatermPrev<CR>', opts)

-- table-mode
keymap('n', '<M-T>', '<Cmd>TableModeToggle<CR>', opts)
keymap('n', '<M-R>', '<Cmd>TableModeRealign<CR>', opts)
