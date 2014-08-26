set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle
call vundle#begin()

Plugin 'gmarik/vundle'
Plugin 'L9'
Plugin 'FuzzyFinder'
Plugin 'The-NERD-tree'
Plugin 'Tagbar'
Plugin 'bling/vim-airline'
"Plugin 'Lokaltog/vim-powerline.git'
Plugin 'terryma/vim-multiple-cursors.git'
Plugin 'a.vim'
Plugin 'minibufexpl.vim'
Plugin 'clang-complete'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'ctrlp.vim'
Plugin 'molokai'
Plugin 'Keithbsmiley/investigate.vim'
Plugin 'mattn/gist-vim'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdcommenter'
"Plugin 'FriedSock/smeargle'
"Plugin 'snipMate'
"Plugin 'OmniCppComplete'
Plugin 'mbbill/undotree'

if has("python")
    Plugin 'SirVer/ultiSnips'
endif

Plugin 'honza/vim-snippets'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'TaskList.vim'
"Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'Yggdroot/indentLine'
Plugin 'kien/rainbow_parentheses.vim'

"Plugin 'MarcWeber/vim-addon-mw-utils'
"Plugin 'tomtom/tlib_vim'
"Plugin 'garbas/vim-snipmate'

call vundle#end()

filetype plugin indent on

syntax on
colorscheme molokai

let mapleader=";"

if has("gui_running")
    set guioptions-=T    
else
    set t_Co=256
    colorscheme molokai
endif

"set guifont=文泉驿等宽微米黑\ 12
set guifont=DejaVu\ Sans\ Mono\ 10

set nobackup
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
"set list
"let g:indent_guides_auto_colors=0
"let g:indent_guides_start_level=2
"let g:indent_guides_guide_size=1
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
"let g:indentLine_color_term = 239
"let g:indentLine_color_gui = '#A4E57E'
"let g:indentLine_char = '┆'
"IndentGuidesToggle

"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = '<'
"let g:airline#extensions#tabline#right_sep = '>'
"

let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces


let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1

"let t_Co=256
set laststatus=2
"set encoding=utf-8
"let g:Powerline_symbols = 'unicode'

let g:clang_complete_copen=1
let g:clang_periodic_quickfix=0
let g:clang_sinppets=1
let g:clang_close_preview=1
let g:clang_user_library=1
let g:clang_user_options="-fexceptions -I/usr/include -I/usr/local/include"


"let g:syntastic_c_cflags_file=".clang_complete"
"let g:airline#extension#tabline#enabled = 1
"let g:ctrlp_cmd = 'CtrlPBuffer'

set listchars=tab:→→,eol:◀,trail:·,nbsp:▢

imap <C-f> <ESC>:FufBuffer <cr>
nnoremap <F5> :UndotreeToggle <cr>
nnoremap <F3> :NERDTreeToggle <cr>
nnoremap <F4> :TagbarToggle <cr>
nnoremap <F10> :PluginUpdate <cr>
nnoremap <leader>n :set number <cr>
nnoremap <leader>N :set nonumber <cr>
nnoremap <leader>l :set list <cr>
nnoremap <leader>L :set nolist <cr>

nmap <silent> <leader>f :FufBuffer <cr>
nmap <silent> <leader>q :q <cr>
nmap <silent> <leader>w :w <cr>
nmap <silent> <leader>a :A <cr>
nmap <silent> <leader>d :TaskList <cr>

nmap <Leader> <Plug>(easymotion-prefix)
nmap / <Plug>(easymotion-sn)
nmap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

"nerdcommment <leader>cc <leader>cu
 
"PluginUpdate
