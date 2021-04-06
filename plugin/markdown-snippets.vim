" markdown快捷输入
" "替换操作
 autocmd Filetype markdown inoremap ,f <Esc>/<++><CR>:nohlsearch<CR>c4l
" "一级标题
 autocmd Filetype markdown inoremap ,1 #<Space><Enter><Enter><++><Esc>2kA
" "二级标题
 autocmd Filetype markdown inoremap ,2 ##<Space><Enter><Enter><++><Esc>2kA
" "三级标题
 autocmd Filetype markdown inoremap ,3 ###<Space><Enter><Enter><++><Esc>2kA
" "四级标题
 autocmd Filetype markdown inoremap ,4 ####<Space><Enter><Enter><++><Esc>2kA
" "五级标题
 autocmd Filetype markdown inoremap ,5 #####<Space><Enter><Enter><++><Esc>2kA
" "六级标题
 autocmd Filetype markdown inoremap ,6 ######<Space><Enter><Enter><++><Esc>2kA
" "斜体文本
 autocmd Filetype markdown inoremap ,i **<++><Esc>F*hi
" "粗体文本
 autocmd Filetype markdown inoremap ,s ****<++><Esc>F*hi
" "粗斜体文本
" autocmd Filetype markdown inoremap ,si ******<++><Esc>F*hi
" "下划线
" autocmd Filetype markdown inoremap ,st ~~~~<++><Esc>F~hi
" "高亮
 autocmd Filetype markdown inoremap ,h ====<++><Esc>F=hi
" "插入图片
 autocmd Filetype markdown inoremap ,p ![](<++>)<++><Esc>F[a
" "插入链接
 autocmd Filetype markdown inoremap ,a [](<++>)<++><Esc>F[a
" "插入分隔线
 autocmd Filetype markdown inoremap ,n ---<Enter><Enter>
" "插入代码块
 autocmd Filetype markdown inoremap ,c ```<Enter><++><Enter>```<Enter><Enter><++><Esc>4kA
