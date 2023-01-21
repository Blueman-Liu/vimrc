" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

runtime! debian.vim

" Vim will load $VIMRUNTIME/defaults.vim if the user does not have a vimrc.
" This happens after /etc/vim/vimrc(.local) are loaded, so it will override
" any settings in these files.
" If you don't want that to happen, uncomment the below line to prevent
" defaults.vim from being loaded.
" let g:skip_defaults_vim = 1

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"filetype plugin indent on

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

"echo "(>^.^<)"

"-----------------------------------------------"
"               基础设置                        "
"-----------------------------------------------"
call plug#begin('~/.vim/plugged')
Plug 'dracula/vim',{'as':'dracula'}
Plug 'mbbill/undotree'
Plug 'preservim/nerdtree'
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }   "<leader>f
Plug 'sillybun/vim-autodoc'
" 给所有函数加上docstring
":RecordParameter
" 给当前光标下的函数加上docstring
":RecordCurrentFunction
Plug 'dense-analysis/ale'                   "语法检查
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
Plug 'preservim/nerdcommenter'              "num/cc num/cu num/ci
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()


"-----------------------------------------------"
"               自定义功能                      "
"-----------------------------------------------"
colorscheme dracula
"hi Normal ctermfg=252 ctermbg=none
hi pythonSelf ctermfg=174 guifg=#6094DB cterm=bold gui=bold

" nerdcommenter----------------------
" Create default mappings
let g:NERDCreateDefaultMappings = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

" 快捷键绑定-------------------------
map ff :NERDTreeToggle<CR>
map <F5> :UndotreeToggle<CR>
"map rc : e $HOME\_vimrc<CR>        "windows
"inoremap <esc> <nop>                "将esc映射为空
"inoremap ;k <esc>                   "将插入模式下的jk映射为esc

"-----------------------------------------------"
"               基础设置                        "
"-----------------------------------------------"
set selection=exclusive
set selectmode=mouse,key
set termguicolors               "24bit colors
set ic
set fileencodings=utf-8,ucs-bom,GB2312,big5
set number
set relativenumber
set backspace=indent,eol,start
set encoding=utf-8
syntax on
set nocompatible
filetype on
filetype indent on
filetype plugin on
set mouse=a
let &t_ut=''
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set listchars=tab:▸\ ,trail:▫
set scrolloff=5
set foldmethod=indent
set foldlevel=99
set laststatus=2
set autoindent
set cursorline
"set cursorcolumn
set wrap
set showcmd
set wildmenu
set wildmode=longest:list,full
set hlsearch		
set incsearch	
set ignorecase		
set smartcase
set showmode
set t_Co=256
set textwidth=80
set linebreak
set wrapmargin=2
set ruler
set showmatch
set spell spelllang=en_us
set undofile
set autochdir
"set noerrorbells
"set visualbell
set history=1024
set autoread
"set guifont=Powerline_Consolas:h16:cANSI:qDRAFT
set guifont=Consolas:h14
set noswapfile
set nobackup
"set backupdir=~/.vim/.backup//  
"set directory=~/.vim/.swap//
set undodir=~/.vim/.undo// 


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" <<<<< Quickly Run
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

map <F5> :call CompileRunGcc()<CR>

func! CompileRunGcc()
    exec "w" 
    if &filetype == 'c' 
        exec '!g++ % -o %<'
        exec '!time ./%<'
    elseif &filetype == 'cpp'
        exec '!g++ % -o %<'
        exec '!time ./%<'
    elseif &filetype == 'python'
        exec '!time python %'
    elseif &filetype == 'sh'
        :!time bash %
    endif                                                                              
endfunc 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Quickly Run >>>>>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif
