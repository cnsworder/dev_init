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
"Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'Yggdroot/indentLine'
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
Plugin 'vim-scripts/UltiSnips'
"Plugin 'garbas/vim-snipmate'

call vundle#end()

filetype plugin indent on

syntax on
colorscheme molokai

if has("gui_running")
    set guioptions-=T    
else
    set t_Co=256
    colorscheme molokai
endif

"set guifont=文泉驿等宽微米黑\ 12
set guifont=DejaVu\ Sans\ Mono\ 12

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

nmap <C-f> :FufBuffer <cr>
nnoremap <F5> :UndotreeToggle <cr>
nnoremap <F3> :NERDTreeToggle <cr>
nnoremap <F4> :TagbarToggle <cr>
nnoremap <F10> :PluginUpdate <cr>
nnoremap <F2> :e <cr>

"PluginUpdate
