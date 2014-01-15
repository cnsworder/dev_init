set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'The-NERD-tree'
Bundle 'Tagbar'
Bundle 'git://github.com/Lokaltog/vim-powerline.git'
Bundle 'git://github.com/terryma/vim-multiple-cursors.git'
"Bundle 'OmniCppComplete'
Bundle 'a.vim'
"Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'Yggdroot/indentLine'
"Bundle 'minibufexpl.vim'
Bundle 'clang-complete'
Bundle 'scrooloose/syntastic'
Bundle 'vim-airline'
Bundle 'ctrlp.vim'
"Bundle 'snipMate'

syntax on
if has('gui_runing')
    colorscheme torte
else
    colorscheme ron
endif

set guifont=文泉驿等宽微米黑\ Bold\ 12

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

"let t_Co=256
set laststatus=2
"set encoding=utf-8
"let g:Powerline_symbols = 'unicode'

let g:clang_complete_copen=1
let g:clang_periodic_quickfix=1
let g:clang_sinppets=1
let g:clang_close_preview=1
let g:clang_user_library=1
let g:clang_user_options="-fexceptions -I/usr/include -I/usr/local/include"
"let g:syntastic_c_cflags_file=".clang_complete"
let g:airline#extension#tabline#enabled = 1
"let g:ctrlp_cmd = 'CtrlPBuffer'
nmap <C-f> :FufBuffer <cr>
