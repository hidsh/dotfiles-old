" gui setting

set showtabline=2
"set transparency=5
set imdisable
set guioptions-=T
set antialias
set tabstop=4
set number
set nobackup
set visualbell t_vb=
set nowrapscan
set columns=100
set lines=48

set gcr=a:blinkwait0,a:block-cursor
set guicursor

" set guifont=Menlo\ Regular:h14
set guifont=Menlo\ for\ Powerline:h14
"set guifontwide=ヒラギノ丸ゴ\ StdN\ W4:h15
"colorscheme desert
"colorscheme zenburn
colorscheme molokai

" 検索結果の色
highlight Search term=reverse cterm=reverse gui=reverse guifg=#808080 guibg=#080808


" .vimrc と .gvmrc を保存と同時に反映させる
" autocmd BufWritePost .vimrc source % source ~/.gvimrc
" autocmd BufWritePost .gvimrc source %
