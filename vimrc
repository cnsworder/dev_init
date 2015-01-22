set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle
call vundle#begin()

"包管理
Plugin 'gmarik/vundle'
Plugin 'L9'
"目录树
Plugin 'The-NERD-tree'
"快速搜索
Plugin 'FuzzyFinder'
Plugin 'ctrlp.vim'
"状态栏
Plugin 'bling/vim-airline'
"Plugin 'Lokaltog/vim-powerline.git'
"多光标
Plugin 'terryma/vim-multiple-cursors.git'

"头文件和源文件快速跳转
Plugin 'a.vim'
"标签页
Plugin 'minibufexpl.vim'
"代码提示
Plugin 'clang-complete'
"Plugin 'Valloric/YouCompleteMe'
"代码检查
Plugin 'scrooloose/syntastic'
"git
Plugin 'mattn/gist-vim'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
"代码注释
Plugin 'scrooloose/nerdcommenter'

"代码导航
Plugin 'Tagbar'
"代码段提示
Plugin 'honza/vim-snippets'
if has("python")
    Plugin 'SirVer/ultiSnips'
endif

"代码导航
Plugin 'gtags.vim'

"帮助文档
"Plugin 'Keithbsmiley/investigate.vim'
Plugin 'KabbAmine/zeavim.vim'

"Plugin 'FriedSock/smeargle'
"Plugin 'snipMate'
"Plugin 'OmniCppComplete'

"搜索定位
Plugin 'Lokaltog/vim-easymotion'
"任务列表
Plugin 'TaskList.vim'
"Plugin 'nathanaelkane/vim-indent-guides'
"撤销树
Plugin 'mbbill/undotree'
"缩进提示
Plugin 'Yggdroot/indentLine'
"括号高亮
Plugin 'kien/rainbow_parentheses.vim'
"括号补全
Plugin 'jiangmiao/auto-pairs'
Plugin 'surround.vim'

"主题配色
Plugin 'molokai'
Plugin 'tango.vim'

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
    colorscheme tango
endif

"set guifont=文泉驿等宽微米黑\ 12
"set guifont=DejaVu\ Sans\ Mono\ 10
set guifont=Source\ Code\ Pro\ 10

set nobackup
set cursorline
"set cursorcolumn
set hlsearch
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
set number
set cscopeprg=gtags-cscope
"cscope add GTAGS

"set encoding=utf-8
"let g:Powerline_symbols = 'unicode'

let g:clang_complete_copen=1
let g:clang_periodic_quickfix=1
let g:clang_sinppets=1
let g:clang_close_preview=1
let g:clang_user_library=1
let g:clang_user_options=" -stdlib=libc++ -std=c++14 -Wall -fexceptions -I/usr/include -I/usr/local/include -I/usr/include/c++/4.9.2 -I/usr/include/c++/4.9.2/x86_64-unknown-linux-gnu"

let g:syntastic_check_on_open = 1
let g:syntastic_cpp_compiler_options = ' -std=c++14 -Wall'

"let g:syntastic_c_cflags_file=".clang_complete"
"let g:airline#extension#tabline#enabled = 1
"let g:ctrlp_cmd = 'CtrlPBuffer'

set listchars=tab:→→,eol:◀,trail:·,nbsp:▢

imap <C-f> <ESC>:FufBuffer <cr>
nnoremap <F5> :UndotreeToggle <cr>
nnoremap <F3> :NERDTreeToggle <cr>
nnoremap <F4> :TagbarToggle <cr>
nnoremap <F10> :PluginUpdate <cr>
nnoremap <leader>n :set number! <cr>
nnoremap <leader>l :set list! <cr>

nmap <silent> <leader>f :FufBuffer <cr>
nmap <silent> <leader>q :q <cr>
nmap <silent> <leader>qq :q! <cr>
nmap <silent> <leader>w :w <cr>
nmap <silent> <leader>wq :wq <cr>
nmap <silent> <leader>a :A <cr>
nmap <silent> <leader>d :TaskList <cr>

nmap <Leader> <Plug>(easymotion-prefix)
nmap / <Plug>(easymotion-sn)
nmap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

"nerdcommment <leader>cc <leader>cu
 
"PluginUpdate
