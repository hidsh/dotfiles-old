set autoindent 
set backupdir=$HOME/bak
set clipboard+=unnamed

set paste
set expandtab
set textwidth=0
set tabstop=4
set softtabstop=4
set shiftwidth=4
set backspace=indent,eol,start
set incsearch
set ignorecase
set wildmenu
set commentstring=\ #\ %s
set foldlevel=0
syntax on

" for clipboard on tmux
set clipboard=unnamed

" vundle
set nocompatible
filetype off

set rtp+=~/dotfiles/vundle.git/
call vundle#rc()

" Bundle...は使用するプラグインを書く。詳細はguthubのREADMEが詳しい。type :BundleInstall
Bundle 'tomasr/molokai' 
Bundle 'lsdr/monokai'
Bundle 'w0ng/vim-hybrid'
Bundle 'altercation/vim-colors-solarized'
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/unite.vim'
Bundle 'thinca/vim-ref'
Bundle 'thinca/vim-quickrun'
filetype plugin indent on     " required!

set background=dark
let g:rehash256 = 1
colorscheme molokai

"vi互換をオフする
set nocompatible
 
"スワップファイル用のディレクトリを指定する
set directory=$HOME/bak
 
"変更中のファイルでも、保存しないで他のファイルを表示する
set hidden
 
"行番号を表示する
"set number
 
"閉括弧が入力された時、対応する括弧を強調する
set showmatch
 
"新しい行を作った時に高度な自動インデントを行う
set smarttab
 
" grep検索を設定する
set grepformat=%f:%l:%m,%f:%l%m,%f\ \ %l%m,%f
set grepprg=grep\ -nh
 
" 検索結果のハイライトをEsc連打でクリアする
nnoremap <ESC><ESC> :nohlsearch<CR>

" カレントウィンドウにのみ罫線を引く
set cursorline
augroup cch
autocmd! cch
autocmd WinLeave * set nocursorline
autocmd WinEnter,BufRead * set cursorline
augroup END
:hi clear CursorLine
:hi CursorLine gui=underline
highlight CursorLine ctermbg=black guibg=black

" : --> ;
noremap ; :
noremap : ;

" $ --> 4
noremap $ 4
noremap 4 $

" P --> p
noremap P p
noremap p P

" Spaceキーで画面スクロール
nnoremap <SPACE>   <PageDown>
nnoremap n <PageUp>


"ビジュアルモード時vで行末まで選択
vnoremap v $h


" カレントディレクトリを自動的に移動
augroup BufferAu
    autocmd!
    autocmd BufNewFile,BufRead,BufEnter * if isdirectory(expand("%:p:h")) && bufname("%") !~ "NERD_tree" | cd %:p:h | endif
augroup END

"強制全保存終了を無効化。
nnoremap ZZ <Nop>

"現在開いているvimスクリプトファイルを実行。
nnoremap <F8> :source %<CR>
