"  ██████   █████                   █████   █████  ███
" ░░██████ ░░███                   ░░███   ░░███  ░░░
"  ░███░███ ░███   ██████   ██████  ░███    ░███  ████  █████████████
"  ░███░░███░███  ███░░███ ███░░███ ░███    ░███ ░░███ ░░███░░███░░███
"  ░███ ░░██████ ░███████ ░███ ░███ ░░███   ███   ░███  ░███ ░███ ░███
"  ░███  ░░█████ ░███░░░  ░███ ░███  ░░░█████░    ░███  ░███ ░███ ░███
"  █████  ░░█████░░██████ ░░██████     ░░███      █████ █████░███ █████
" ░░░░░    ░░░░░  ░░░░░░   ░░░░░░       ░░░      ░░░░░ ░░░░░ ░░░ ░░░░░

"   @Author: gin

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
" 解决从telescope打开文件后不能折叠
augroup fold_after_telescope
  autocmd!
  autocmd BufRead * autocmd BufWinEnter * ++once normal! zx
augroup END
" 设置ejs的文件类型为html
augroup fold_after_telescope
  autocmd!
  autocmd BufNewFile,BufRead *.ejs set filetype=html
augroup END

" -----------------------------------------------------------------
"                                                                 -
" plugin config for which written in vimscript                    -
"                                                                 -
" -----------------------------------------------------------------
" markdown-preview
let g:mkdp_auto_start = 0
let g:mkdp_refresh_slow = 1
let g:mkdp_browser = 'firefox'
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
  endif
endfunc

" -----------------------------------------------------------------
"                                                                 -
" load plugin config in lua/plugins                               -
"                                                                 -
" -----------------------------------------------------------------
lua << EOF
require('core.disabled')
require('core.options')
require('core.keymaps')
require('core.lazy')

-- ui
require('core.colorscheme')
require('plugins.alpha-nvim')
require('plugins.lualine')
require('plugins.nvim-treesitter')
require('plugins.indent-blankline')

-- lsp
require('plugins.nvim-lspconfig')
require('plugins.mason')
require('plugins.mason-lspconfig')
require('plugins.conform')

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
