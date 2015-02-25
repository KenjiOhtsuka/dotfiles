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

"NeoBundle Scripts-----------------------------
if has('vim_starting')
  set nocompatible               " Be iMproved

  " Required:
  set runtimepath+=/home/kenji/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('/home/kenji/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'

NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'rking/ag.vim'
NeoBundle 'majutsushi/tagbar'
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2

NeoBundle 'Shougo/neocomplcache.vim'
let g:neocomplcache_enable_at_startup = 1

" You can specify revision/branch/tag.
NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------

