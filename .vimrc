" Color "

" Lines "
set nu
set cursorline
hi cursorline cterm=NONE ctermbg=darkgray ctermfg=NONE
hi cursorlineNR cterm=NONE ctermbg=darkgray ctermfg=blue

" Tabbing "
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4

" Auto-closing brackets "
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>

" Carrige returns for {} "
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" Set Terminal For Better Compatibility "
" set term=xterm "
