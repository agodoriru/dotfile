
" $ git clone URL
" $ cp 
" $ vim ~/.vimrc
" $:source ~/.vimrc

" ==========================================
" basic 標準設定
" ==========================================
set encoding=utf-8 "文字コード:UTF-8
set fileencoding=utf-8
set nobackup "バックアップファイルを作成しない
set noswapfile "スワップファイルを作成しない
set autoread "編集中のファイルが変更されたら自動で読み直す
set hidden "バッファが編集中でもその他のファイルを開けるように
set showcmd "入力中のコマンドをステータスに表示する

" ==========================================
" view                                                 "見た目
" ==========================================
set number "行番号を表示
set cursorline "現在の行を強調表示
set virtualedit=onemore "行末の1文字先までカーソルを移動できるようにする

"インデントはスマートインデント
set smartindent "smartindent有効化
set autoindent "autoindent有効化
set showmatch "括弧入力時の対応する括弧を表示

set laststatus=2 "ステータスラインを常に表示
set showmode
set showcmd
set ruler
set wildmode=list:longest "コマンドラインの補完

"折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk

"coler scheme
let g:hybrid_use_iTerm_colors = 1
hi String     ctermfg=red guifg=Orange cterm=none gui=none
syntax on


" ==========================================
" tab
" ==========================================
set list listchars=tab:\▸\- "不可視文字の可視化(tab 「▸-」と表示)
set noexpandtab "Tab文字を半角スペースを無効化
set tabstop=4 "行頭以外のTab文字の表示数
set shiftwidth=4 "行頭でのTab文字の表示幅



" ==========================================
" search
" ==========================================
set ignorecase "検索文字列が小文字の場合は大文字小文字を区別なく検索する
set smartcase "検索文字列に大文字が含まれている場合は区別して検索する
set incsearch "検索文字列入力時に順次対象文字列にヒットさせる
set wrapscan "検索時に最後まで行ったら最初に戻る
set hlsearch "検索語をハイライト表示

nmap <Esc><Esc> :nohlsearch<CR><Esc> 
" <Esc>２回でハイライト解除


" allow setting
" https://qiita.com/sawanoboly/items/3b599f6141cc637e1e74
"

function! Arrowdisable ()
	noremap <Up> <Nop>
	noremap <Down> <Nop>
	noremap <Left> <Nop>
	noremap <Right> <Nop>
endfunction

function! Arrowenable ()
	noremap <Up> <Up>
	noremap <Down> <Down>
	noremap <Left> <Left>
	noremap <Right> <Right>
endfunction

command! Arrowdisable call Arrowdisable()
command! Arrowenable call Arrowenable()
