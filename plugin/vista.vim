" vista.vim
" -------------------------------------------------------------------
noremap <silent> <M-v> :Vista!!<CR>
noremap <silent> <M-V> :Vista finder<CR>

let g:vista_cursor_delay = 000
let g:vista_disable_statusline = 1
let g:vista_sidebar_width = 40
let g:vista_highlight_whole_line = 1
let g:vista_fzf_preview = ['right:60%']
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]

" function! NearestMethodOrFunction() abort
"   return get(b:, 'vista_nearest_method_or_function', '')
" endfunction
" 
" autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
" 
" let g:lightline = {
"       \ 'colorscheme': 'wombat',
"       \ 'active': {
"       \   'left': [ [ 'mode', 'paste' ],
"       \             [ 'readonly', 'filename', 'modified', 'method' ] ]
"       \ },
"       \ 'component_function': {
"       \   'method': 'NearestMethodOrFunction'
"       \ },
"       \ }
