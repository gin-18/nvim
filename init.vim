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
" plugin config for which written in vimscript                    -
"                                                                 -
" -----------------------------------------------------------------
" markdown-preview
let g:mkdp_theme = 'dark'
let g:mkdp_auto_start = 0
let g:mkdp_refresh_slow = 1
let g:mkdp_markdown_css = expand('~/.config/nvim/static/markdown.css')
let g:mkdp_highlight_css = expand('~/.config/nvim/static/highlight.css')

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

" -----------------------------------------------------------------
"                                                                 -
" load plugin config in lua/plugins                               -
"                                                                 -
" -----------------------------------------------------------------
lua << EOF
require('core.disabled')
require('core.options')
require('core.keymaps')
require('core.autocmds')
require('core.lazy')
EOF
