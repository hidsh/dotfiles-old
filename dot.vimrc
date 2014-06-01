"-----------------------------------------------------------
" .vimrcを保存と同時に反映させる
if has("autocmd")
  " autocmd bufwritepost .vimrc source %
endif
"-----------------------------------------------------------
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
"set clipboard=unnamed

"-----------------------------------------------------------
set nocompatible
filetype off
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }

NeoBundleCheck
"------------------------------------------------------------
NeoBundle 'tomasr/molokai'
NeoBundle 'sickill/vim-monokai'
"NeoBundle 'lsdr/monokai'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'thinca/vim-ref'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'YankRing.vim'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle "tyru/caw.vim.git"
NeoBundle 'kana/vim-smartinput'
NeoBundle 'itchyny/lightline.vim'
"------------------------------------------------------------
filetype plugin indent on     " required!

set background=dark
let g:rehash256 = 1
colorscheme molokai
" colorscheme solarized

"スワップファイル用のディレクトリを指定する
set directory=$HOME/bak

"変更中のファイルでも、保存しないで他のファイルを表示する
set hidden

"行番号を表示する
set number

"閉括弧が入力された時、対応する括弧を強調する
set showmatch

"検索時に大文字を含んでいたら大/小を区別
set smartcase

" 検索がファイル末尾まで進んだら、ファイル先頭から再び検索する
set wrapscan

"新しい行を作った時に高度な自動インデントを行う
set smarttab

" 検索結果のハイライトをEsc連打でクリアする
nnoremap <ESC><ESC> :nohlsearch<CR>

" grep検索を設定する
set grepformat=%f:%l:%m,%f:%l%m,%f\ \ %l%m,%f
set grepprg=grep\ -nh

" カレントウィンドウにのみ罫線を引く
set cursorline
augroup cch
autocmd! cch
autocmd WinLeave * set nocursorline
autocmd WinEnter,BufRead * set cursorline
augroup END
:hi clear CursorLine
:hi CursorLine
highlight CursorLine ctermbg=black guibg=black

" : --> ;
"noremap ; :
"noremap : ;

" $ --> 4
"noremap $ 4
"noremap 4 $

" P --> p
" noremap P p
" noremap p P

" Spaceキーで画面スクロール
nnoremap <SPACE>   <PageDown>
nnoremap <S-SPACE> <PageUp>


"ビジュアルモード時vで行末まで選択
vnoremap v $h

" カレントディレクトリを自動的に移動
augroup BufferAu
    autocmd!
    autocmd BufNewFile,BufRead,BufEnter * if isdirectory(expand("%:p:h")) && bufname("%") !~ "NERD_tree" | cd %:p:h | endif
augroup END

"強制全保存終了を無効化。
nnoremap ZZ <Nop>

"cursor
if has('multi_byte_ime') || has('xim')
    " 日本語入力ON時のカーソルの色を設定
    highlight CursorIM guibg=Purple guifg=NONE
endif

" ウィンドウ分割で上や左にではなく右や下に開くように
set splitright
set splitbelow

" >や<をshiftwidthの倍数倍に丸めるようにする
set shiftround

" カンマ(,)の後に自動的にスペースを入れる
inoremap , ,<Space>

" カーソル移動を物理行でなくレイアウト行で
" 物理行で移動するにはC-pやC-nで
nnoremap j gj
nnoremap k gk
nnoremap <Up> gk
nnoremap <Down> gj

" Hで行頭、Lで行末へ
" ノーマルモード、ビジュアルモード、演算待モードで有効
map H 0
map L $

" vvで行単位選択ビジュアルモードに入る。元のVが打ちづらかったので
nnoremap vv V

" 検索結果を画面中央に表示するようにする
noremap n nzz
noremap N Nzz
noremap * *zz
noremap # #zz

" x, Xで削除した文字はレジスタに突っ込ませないようにする
nnoremap x "_x
nnoremap X "_X
" YankRingでも同じように
let g:yankring_n_keys = 'Y D'

" <C-hjkl>でウィンドウ移動
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" <ESC>と誤爆しやすい<F1>でヘルプが表示されないように
inoremap <F1> <Nop>
nnoremap <F1> <Nop>

" *.mdなファイルのfiletypeををmodula2ではなくmarkdownとする
autocmd BufNewFile,BufRead *.md setfiletype markdown

" YankRing.vim
let g:yankring_history_dir = $HOME.'/.vim/'
let g:yankring_history_file = '.yankring_history'

" jellybeans
" 背景色を濃い灰色ではなく黒にする
let g:jellybeans_background_color_256 = 0
let g:jellybeans_background_color = "000000"

" Unite
" call unite#custom_default_action('file', 'tabopen')
let g:neomru#file_mru_path=expand('~/.vim/etc/neomru/file')
let g:neomru#directory_mru_path=expand('~/.vim/etc/neomru/directory')
let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable =1
let g:unite_source_file_mru_limit = 200
nnoremap <silent> ,uu :<C-u>Unite file_mru buffer<CR>

" Lokaltog/vim-easymotion
" http://blog.remora.cx/2012/08/vim-easymotion.html
" ホームポジションに近いキーを使う
let g:EasyMotion_keys='hjklasdfgyuiopqwertnmzxcvbHJKLASDFGYUIOPQWERTNMZXCVB'
" 「;」 + 何かにマッピング
let g:EasyMotion_leader_key=";"
" 1 ストローク選択を優先する
let g:EasyMotion_grouping=1
" カラー設定変更
hi EasyMotionTarget ctermbg=none ctermfg=red
hi EasyMotionShade  ctermbg=none ctermfg=blue

" comment out toggle --> \c
nmap <Leader>c <Plug>(caw:i:toggle)
vmap <Leader>c <Plug>(caw:i:toggle)


" 保存時に行末の空白を除去する
autocmd BufWritePre * :%s/\s\+$//ge
" 保存時にtabをスペースに変換する
"autocmd BufWritePre * :%s/\t/ /ge

" 日本語入力をリセット
au BufNewFile,BufRead * set iminsert=0


" lightline
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'filename' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'MyFugitive',
      \   'readonly': 'MyReadonly',
      \   'modified': 'MyModified',
      \   'filename': 'MyFilename'
      \ },
      \ 'separator': { 'left': '⮀', 'right': '⮂' },
      \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
      \ }

function! MyModified()
  if &filetype == "help"
    return ""
  elseif &modified
    return "+"
  elseif &modifiable
    return ""
  else
    return ""
  endif
endfunction

function! MyReadonly()
  if &filetype == "help"
    return ""
  elseif &readonly
    return "⭤"
  else
    return ""
  endif
endfunction

function! MyFugitive()
  if exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? '⭠ '._ : ''
  endif
  return ''
endfunction

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
       \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
       \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction




