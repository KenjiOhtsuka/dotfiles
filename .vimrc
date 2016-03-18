let php_parent_error_close = 1
let php_sql_query = 1
au BufRead,BufNewFile,BufReadPre *.coffee set filetype=coffee

set number
"改行時に前のインデントを継続する
set autoindent
"改行時に、入力されている行の末尾に合わせてインデントを調整する
set smartindent
"自動インデントでずれる幅
set shiftwidth=2
"画面上タブが占める幅
set tabstop=2
"連続した空白に対して tab, backspace で移動する幅
set softtabstop=2
set expandtab
colorscheme elflord
if system('uname') =~ 'Darwin'
  colorscheme torte
endif
set colorcolumn=80
set cursorline
set cursorcolumn
set wrap

"NeoBundle Scripts-----------------------------
" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/neocomplete'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'kchmck/vim-coffee-script'

NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'rking/ag.vim'
NeoBundle 'majutsushi/tagbar'
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2

NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/neocomplcache.vim'
let g:neocomplcache_enable_at_startup = 1

" You can specify revision/branch/tag.
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'joonty/vdebug'
NeoBundle 'taglist.vim'
NeoBundle 'tpope/vim-rails'

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------

let NERDTreeShowHidden = 1

let Tlist_Use_Right_Window = 1

syntax on

autocmd VimEnter * execute 'NERDTree'
autocmd VimEnter * execute 'Tlist'
autocmd VimEnter * wincmd l

hi CursorColumn term=underline cterm=underline
