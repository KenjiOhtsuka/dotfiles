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
set colorcolumn=80
set cursorline
set cursorcolumn
set wrap

let g:pdv_template_dir = $HOMR."/.vim/bundle/pdv/templates_snip"

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
NeoBundle 'tpope/vim-commentary'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'sheerun/vim-polyglot'
NeoBundle 'vim-scripts/grep.vim'
"NeoBundle 'vim-scripts/CSApprox'
NeoBundle 'bronson/vim-trailing-whitespace'
NeoBundle 'jiangmiao/auto-pairs'

NeoBundle 'scrooloose/nerdtree'
NeoBundle 'jistr/vim-nerdtree-tabs.git'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'rking/ag.vim'
NeoBundle 'majutsushi/tagbar'
"" Vim Session
NeoBundle 'xolox/vim-misc'
NeoBundle 'xolox/vim-session'
"" Snippets
NeoBundle 'SirVer/ultisnips'
NeoBundle 'FelikZ/ctrlp-py-matcher'
NeoBundle 'honza/vim-snippets'
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2

NeoBundle 'Shougo/vimproc', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/neocomplcache.vim'
let g:neocomplcache_enable_at_startup = 1

" You can specify revision/branch/tag.
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'joonty/vdebug'
NeoBundle 'taglist.vim'
NeoBundle 'tpope/vim-rails'
" input `if` and press enter then `end` will be inserted
NeoBundle 'tpope/vim-endwise'

" for php
NeoBundle 'tobyS/pdv'

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
autocmd BufEnter * execute 'NERDTreeMirror'

hi CursorColumn cterm=NONE ctermbg=gray ctermfg=white guibg=gray guifg=white
colorscheme elflord
if system('uname') =~ 'Darwin'
  colorscheme Monokai
endif
set showcmd

" session management
let g:session_directory = "~/.vim/session"
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_command_aliases = 1

" vim-airline
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" vim-airline
let g:airline_theme = 'term'
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 0
let g:airline#extensions#virtualenv#enabled = 1

if !exists('g:airline_powerline_fonts')
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'
  let g:airline_left_sep          = '▶'
  let g:airline_left_alt_sep      = '»'
  let g:airline_right_sep         = '◀'
  let g:airline_right_alt_sep     = '«'
  let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
  let g:airline#extensions#readonly#symbol   = '⊘'
  let g:airline#extensions#linecolumn#prefix = '¶'
  let g:airline#extensions#paste#symbol      = 'ρ'
  let g:airline_symbols.linenr    = '␊'
  let g:airline_symbols.branch    = '⎇'
  let g:airline_symbols.paste     = 'ρ'
  let g:airline_symbols.paste     = 'Þ'
  let g:airline_symbols.paste     = '∥'
  let g:airline_symbols.whitespace = 'Ξ'
else
  let g:airline#extensions#tabline#left_sep = ''
  let g:airline#extensions#tabline#left_alt_sep = ''

  " powerline symbols
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ''
endif

" PHP
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
let php_parent_error_close = 1
let php_sql_query = 1
nnoremap <buffer> <C-p> :call pdv#DocumentWithSnip()<CR>
"" Include user's local vim config
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

hi CursorColumn term=underline cterm=underline
