" ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗
" ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║
" ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║
" ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║
" ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║
" ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝

" @Author: gin

" -----------------------------------------------------------------
"                                                                 -
" Auto load for first time uses                                   -
"                                                                 -
" -----------------------------------------------------------------
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" -----------------------------------------------------------------
"                                                                 -
" auto-command                                                    -
"                                                                 -
" -----------------------------------------------------------------
" 设置重新进入文件时，光标留在上次退出的地方
augroup back_to_leave
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
augroup END

" -----------------------------------------------------------------
"                                                                 -
" vim-plug                                                        -
"                                                                 -
" -----------------------------------------------------------------
let g:plug_url_format='https://ghproxy.com/https://github.com/%s'

call plug#begin('$HOME/.config/nvim/plugged')
" colorscheme
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
" Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'andersevenrud/nordic.nvim'
Plug 'projekt0n/github-nvim-theme'

" lsp
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'

" complement
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-cmdline'

" snippet
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'rafamadriz/friendly-snippets'

" git
Plug 'kdheepak/lazygit.nvim'
Plug 'lewis6991/gitsigns.nvim'

" fuzzy finder
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

" explorer
Plug 'kyazdani42/nvim-tree.lua'
Plug 'kyazdani42/nvim-web-devicons'

" statusline
Plug 'nvim-lualine/lualine.nvim'

" for markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install', 'for': ['markdown', 'vim-plug'] } " markdown-preview requires 'nodejs' & 'yarn'
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle', 'for': ['markdown', 'vim-plug'] }
Plug 'ferrine/md-img-paste.vim', { 'for': ['markdown', 'vim-plug'] }

" front end
Plug 'windwp/nvim-ts-autotag'
Plug 'norcalli/nvim-colorizer.lua'

" utils
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' } " code highlight
Plug 'numToStr/Comment.nvim' " comment
Plug 'folke/todo-comments.nvim'
Plug 'jose-elias-alvarez/null-ls.nvim' " use for code format
Plug 'ahmedkhalf/project.nvim' " use for telescope search project
Plug 'voldikss/vim-translator'
Plug 'voldikss/vim-floaterm', { 'on': 'FloatermToggle' }  " terminal
Plug 'lukas-reineke/indent-blankline.nvim'  " indent line
Plug 'yaocccc/nvim-hlchunk'
Plug 'tpope/vim-surround'
Plug 'windwp/nvim-autopairs'
Plug 'glepnir/dashboard-nvim'
call plug#end()

" -----------------------------------------------------------------
"                                                                 -
" plugin config for written in vimscript                          -
"                                                                 -
" -----------------------------------------------------------------
" markdown-preview
let g:mkdp_auto_start = 0
let g:mkdp_refresh_slow = 1
let g:mkdp_browser = 'microsoft-edge-beta'
let g:mkdp_markdown_css = expand('~/.config/nvim/static/markdown.css')
let g:mkdp_highlight_css = expand('~/.config/nvim/static/highlight.css')
let g:mkdp_theme = 'dark'

" table-mode
function! s:isAtStartOfLine(mapping)
  let text_before_cursor = getline('.')[0 : col('.')-1]
  let mapping_pattern = '\V' . escape(a:mapping, '\')
  let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
  return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
endfunction

inoreabbrev <expr> <bar><bar>
      \ <SID>isAtStartOfLine('\|\|') ?
      \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
inoreabbrev <expr> __
      \ <SID>isAtStartOfLine('__') ?
      \ '<c-o>:silent! TableModeDisable<cr>' : '__'

" md-img-paste
let g:mdip_imgdir = 'images'

autocmd FileType markdown nmap <buffer><silent> <SPACE>pi :call mdip#MarkdownClipboardImage()<CR>

" vim-floaterm
let g:floaterm_borderchars = get(g:, 'floaterm_borderchars', '─│─│╭╮╯╰')

" vim-translator
let g:translator_window_borderchars = ['─', '│', '─', '│', '╭', '╮', '╯', '╰']

" filetype-open
nnoremap R <Cmd>call <SID>FileTypeOpen()<CR>

func! s:FileTypeOpen()
  exec "w"
  if &filetype == 'python'
    :!time python3 %
  elseif &filetype == 'javascript'
    :!time node %
  elseif &filetype == 'markdown'
    silent! exec "MarkdownPreview"
  elseif &filetype == 'tex'
    silent! exec "VimtexStop"
    silent! exec "VimtexCompile"
  endif
endfunc

" -----------------------------------------------------------------
"                                                                 -
" load plugin config for lua                                      -
"                                                                 -
" -----------------------------------------------------------------
lua << EOF
require('core.options')
require('core.keymaps')
require('core.disabled')

-- ui
require('core.colorscheme')
require('plugins.nvim-treesitter')
require('plugins.lualine')
require('plugins.indent-blankline')
require('plugins.dashboard-nvim')

-- lsp
require('plugins.nvim-lspconfig')
require('plugins.mason')
require('plugins.mason-lspconfig')
require('plugins.null-ls')

-- complement
require('plugins.nvim-cmp')
require('plugins.luasnip')

-- files finder
require('plugins.telescope')

-- explorer
require('plugins.nvim-tree')

-- git
require('plugins.lazygit')
require('plugins.gitsigns')

-- front end
require('plugins.nvim-ts-autotag')
require('plugins.nvim-colorizer')

-- utils
require('plugins.project')
require('plugins.comment')
require('plugins.todo-comments')
require('plugins.nvim-autopairs')
EOF
