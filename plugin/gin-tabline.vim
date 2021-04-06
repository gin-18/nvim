" -------------------------------------------------------------------
"
" tabline
"
" -------------------------------------------------------------------
" 定义颜色
hi TabLine gui=bold guifg=#afafff guibg=#4e4e4e
hi TabLineSel gui=bold guifg=#ffffff guibg=#3a3a3a
hi TabLineFill gui=bold guifg=#ffafaf guibg=#4e4e4e

set tabline=%!MyTabLine()
function MyTabLine()
    let s = ''
    for t in range(tabpagenr('$'))
        if t + 1 == tabpagenr()
            let s .= '%#TabLineSel#'
        else
            let s .= '%#TabLine#'
        endif
        let s .= '%' . (t + 1) . 'T'
        let s .= ' '
        let s .= t + 1 . ' '
        let n = ''
        let m = 0
        let bc = len(tabpagebuflist(t + 1))
        for b in tabpagebuflist(t + 1)
            if getbufvar( b, "&buftype" ) == 'help'
                let n .= '[H]' . fnamemodify( bufname(b), ':t:s/.txt$//' )
            elseif getbufvar( b, "&buftype" ) == 'quickfix'
                let n .= '[Q]'
            else
                let n .= pathshorten(bufname(b))
            endif
            if getbufvar( b, "&modified" )
                let m += 1
            endif
            if bc > 1
                let n .= ' '
            endif
            let bc -= 1
        endfor
        if m > 0
            let s .= '[' . m . '+]'
        endif
        if t + 1 == tabpagenr()
            let s .= '%#TabLineSel#'
        else
            let s .= '%#TabLine#'
        endif
        if n == ''
            let s.= '[No Name]'
        else
            let s .= n
        endif
        let s .= ' '
    endfor
    let s .= '%#TabLineFill#%T'
    if tabpagenr('$') > 1
        let s .= '%=%#TabLineFill#'
    endif
    return s
endfunction
