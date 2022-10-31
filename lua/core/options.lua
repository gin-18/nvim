local opt = vim.opt

opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2

opt.scrolloff = 5
opt.encoding = 'utf-8'

opt.autoindent = true
opt.smartindent = true
opt.wrap = true
opt.number = true
opt.relativenumber = true
opt.wildmenu = true
opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.autochdir = true
opt.cursorline = true
opt.termguicolors = true
opt.splitbelow = true
opt.splitright = true
opt.expandtab = true
opt.visualbell = true
opt.showcmd = true
opt.autoread = true
opt.swapfile = false

opt.mouse = ''
opt.signcolumn = 'yes'
opt.shortmess = 'atI'
opt.updatetime = 300
opt.redrawtime = 1500
opt.timeoutlen = 500

-- list char
opt.list = true
opt.listchars = {
  -- tab = '',
  trail = '',
  extends = '»',
  precedes = '«',
  nbsp = '×',
}

-- backup
-- opt.backup = true
-- opt.backupext = '.bak'
-- opt.backupdir = '~/.config/nvim/tmp'

-- undofile
opt.undofile = true
