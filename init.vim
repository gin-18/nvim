" -------------------------------------------------------------------
"
" Auto load for first time uses
"
" -------------------------------------------------------------------
if empty(glob('~/.config/nvim/autoload/plug.vim'))
	!curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source ~/.config/nvim/init.vim
endif

" -------------------------------------------------------------------
"
" vim-init
"
" -------------------------------------------------------------------
" 打开高亮
syntax on
" 不兼容vi
set nocompatible
" 识别文件类型filetype
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
" 设置tab键的缩进格数
set tabstop=2
set shiftwidth=2
set softtabstop=2
" 设置光标距离顶部和底部的固定位置
set scrolloff=5
" 设置编码格式为utf-8
set encoding=utf-8
" 当窗口不能完整显示一行内容时，会换行显示
set wrap
" 显示行号
set number
" 以相对位置的方式显示行号
set relativenumber
" 在命令模式下输入字符时，按下tab键会提示可选项，类似linux终端的自动补全
set wildmenu
" 高亮搜索结果
set hlsearch
" 在搜索状态下输入字符时，显示高亮（边输入边高亮）
set incsearch
" 忽略大小写
set ignorecase
" 智能大小写
set smartcase
" 自动切换当前工作路径
set autochdir
" 将折叠方式设置为manual
set foldmethod=manual
" 光标所在的行高亮
set cursorline
" 窗口在下方打开
set splitbelow
" 启用gui配色
set termguicolors
" 设置颜色主题
colorscheme gin-forest
" 解决不同终端下vim的配色问题
let &t_ut=''
" 设置leader键为空格键
let mapleader=" "
" 设置不同模式下显示不同的光标样式
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
exec "nohlsearch"
" 设置重新进入文件时，光标留在上次退出的地方
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
" 退出插入模式时自动切换到英文
let s:fcitx_cmd = executable("fcitx5-remote") ? "fcitx5-remote" : "fcitx-remote"
autocmd InsertLeave * let b:fcitx = system(s:fcitx_cmd) | call system(s:fcitx_cmd.' -c')
autocmd InsertEnter * if exists('b:fcitx') && b:fcitx == 2 | call system(s:fcitx_cmd.' -o') | endif

" -------------------------------------------------------------------
"
" keyMapping
"
" -------------------------------------------------------------------
" noremap
" -------------------------------------------------------------------
noremap Q :q<CR>
noremap s :w<CR>
noremap S :wq<CR>
noremap K 5k
noremap J 5j
noremap H 0
noremap L $
noremap n nzz
noremap N Nzz
noremap <M-H> <C-w>h
noremap <M-J> <C-w>j
noremap <M-K> <C-w>k
noremap <M-L> <C-w>l
noremap <M-p> "+p
noremap <M-g> :new<CR>:term lazygit<CR>i
noremap <M-t> :new<CR>:term<CR>i
noremap <LEADER>nh :nohlsearch<CR>
noremap <LEADER>co :!chromium %&<CR><CR>
noremap <LEADER>ch o<!----><Esc>F-;i
noremap <LEADER>cc o/**/<Esc>F*i
noremap <LEADER>cj o/*<CR>*/<Esc>O<Tab>
" 打开一个新的标签页
noremap <LEADER>nt :tabe<CR>
" 切换到下一个标签页
noremap <Tab>l gt
" 切换到上一个标签页
noremap <Tab>h gT
" 打开拼写检查
noremap <LEADER>sc :set spell!<CR>
" 上下分屏，并且光标在下屏幕
noremap <LEADER><DOWN> :set splitbelow<CR>:split<CR>
" 左右分屏，并且光标在左屏幕
noremap <LEADER><LEFT> :set nosplitright<CR>:vsplit<CR>
" 改变分屏的大小
noremap <S-UP> :res +5<CR>
noremap <S-DOWN> :res -5<CR>
noremap <S-LEFT> :vertical resize+5<CR>
noremap <S-RIGHT> :vertical resize-5<CR>
" 按两下空格键''并且进入插入模式
noremap <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l

" inoremap
" -------------------------------------------------------------------
inoremap ' ''<Esc>i
inoremap " ""<Esc>i
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap < <><Esc>i
inoremap { {}<Esc>i
inoremap <C-]> <++>

" vnoremap
" -------------------------------------------------------------------
vnoremap Y "+y

" tnoremap
" -------------------------------------------------------------------
tnoremap <M-q> <C-d>

" -------------------------------------------------------------------
"
" autocmd
"
" -------------------------------------------------------------------
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline

" -------------------------------------------------------------------
"
" plugins
"
" -------------------------------------------------------------------
call plug#begin('~/.config/nvim/plugged')

" markdown预览插件
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install', 'for': ['markdown', 'vim-plug'] }

" markdown表格模板插件
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle', 'for': ['markdown', 'vim-plug'] }

" coc.nvim
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" fzf.vim
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" vista.vim
Plug 'liuchengxu/vista.vim', { 'on': ['Vista!!', 'Vista finder']}

" rnvimr
Plug 'kevinhwang91/rnvimr', { 'on': 'RnvimrToggle' }

" vim-startify
Plug 'mhinz/vim-startify'

" translate
Plug 'iamcco/dict.vim', { 'on': ['DictW', '<Plug>DictWSearch', '<Plug>DictWVSearch', '<Plug>DictRSearch', '<Plug>DictRVSearch']}
                                                                                      
" nerdtree
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }

" vim-terminal-help
" Plug 'skywind3000/vim-terminal-help'

" dashboard-nvim
" Plug 'glepnir/dashboard-nvim'

" vim-snippets代码片段库
" Plug 'honza/vim-snippets'

call plug#end()

" -------------------------------------------------------------------
"
" pluginSetting
"
" -------------------------------------------------------------------
" coc.nvim
" -------------------------------------------------------------------
" 自动加载coc插件
let g:coc_global_extensions = [
		\ 'coc-git',
		\ 'coc-html',
		\ 'coc-css',
		\ 'coc-tsserver',
		\ 'coc-vetur',
		\ 'coc-xml',
	 	\ 'coc-yaml',
		\ 'coc-json',
		\ 'coc-emmet',
		\ 'coc-eslint',
		\ 'coc-vimlsp',
		\ 'coc-snippets',
		\ 'coc-highlight',
		\ 'coc-prettier']

set updatetime=160
set shortmess+=c

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

if has("patch-8.1.1564")
  set signcolumn=number
else
  set signcolumn=yes
endif
" GoTo code navigation.
" 跳转到函数所在的位置
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)
nmap <silent> <LEADER>gd <Plug>(coc-definition)

" 跳转到代码有误的地方
nmap <silent> <LEADER>gr <Plug>(coc-diagnostic-prev)

" Use <LEADER>k to show documentation in preview window.
nnoremap <silent> <LEADER>k :call <SID>show_documentation()<CR>

" dict
" -------------------------------------------------------------------
" 翻译光标下的单词并在dict窗口显示
nmap <silent> <LEADER>t <Plug>DictWSearch
vmap <silent> <LEADER>t <Plug>DictWVSearch
" 翻译光标下的单词并替换翻译结果
nmap <silent> <LEADER>r <Plug>DictRSearch
vmap <silent> <LEADER>r <Plug>DictRVSearch
" 输入需要翻译的单词
noremap <M-w> :DictW 

" nerdtree
" -------------------------------------------------------------------
noremap <M-e> :NERDTreeToggle<CR>

let NERDTreeStatusline = -1
let NERDTreeMinimalUI = 1
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" rnvimr
" -------------------------------------------------------------------
nnoremap <silent> <M-r> :RnvimrToggle<CR>

" Make Ranger to be hidden after picking a file
let g:rnvimr_enable_picker = 1

" fzf
" -------------------------------------------------------------------
" 搜索文件
noremap <silent> <M-f> :Files<CR>
" 搜索标记
noremap <silent> <M-m> :Marks<CR>
" 搜索历史文件
noremap <silent> <M-h> :History<CR>
" 搜索Buffers
noremap <silent> <M-b> :Buffers<CR>
" 搜索历史命令
noremap <silent> <M-c> :History:<CR>

" Default fzf layout
" - Popup window
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
" - down / up / left / right
let g:fzf_layout = { 'down': '40%' }

let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

function! s:list_buffers()
  redir => list
  silent ls
  redir END
  return split(list, "\n")
endfunction

function! s:delete_buffers(lines)
  execute 'bwipeout' join(map(a:lines, {_, line -> split(line)[0]}))
endfunction

" Override statusline as you like
function! s:fzf_statusline()
  highlight fzf1 gui=bold guifg=#d7005f guibg=#c6c6c6
  highlight fzf2 gui=bold guifg=#005f5f guibg=#c6c6c6
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fzf
endfunction

autocmd! User FzfStatusLine call <SID>fzf_statusline()

" vim-table-mode
" -------------------------------------------------------------------
noremap <silent> <M-T> :TableModeToggle<CR>

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

" markdown-preview.nvim
" -------------------------------------------------------------------
nnoremap <silent> <M-M> :MarkdownPreview<CR>

" 自动启动(默认为0，改为1为开启自动启动)
let g:mkdp_auto_start = 0
" 自动刷新(默认为0,改为1为开启自动刷新)
let g:mkdp_refresh_slow = 1
" 设置的预览浏览器
let g:mkdp_browser = 'chromium'

" 找到当前光标下的字符属于那个highlight-group
" -------------------------------------------------------------------
noremap <LEADER>si :call <SID>SynStack()<CR>

function! <SID>SynStack()
	if !exists("*synstack")
		return
	endif
	echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunction
