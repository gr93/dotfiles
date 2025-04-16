syntax on
set number
set relativenumber

highlight LineNr ctermfg=white guifg=#D3D3D3
highlight RelLineNr ctermfg=yellow guifg=#FFFF00

" Center after searching with 'n' or 'N'
nnoremap n nzzzv
nnoremap N Nzzzv

" Center after scrolling with Ctrl-D or Ctrl-U
nnoremap <C-D> <C-D>zz
nnoremap <C-U> <C-U>zz

set splitbelow
set splitright

