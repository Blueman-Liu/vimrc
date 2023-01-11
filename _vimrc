call plug#begin('~/.vim/plugged')
Plug 'dracula/vim',{'as':'dracula'}


call plug#end()

colorscheme dracula

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
vnoremap <Leader>y "+y
nmap <Leader>p "+p
map S : w<CR>
map s <nop>
map Q :q<CR>
map R :source $MYVIMRC<CR>
noremap <LEADER><CR>  :nohlsearch<CR>
map spl :set splitright<CR>:vsplit<CR>
map sph :set nosplitright<CR>:vsplit<CR>
map spj :set splitbelow<CR>:split<CR>
map spk :set nosplitbelow<CR>:split<CR>
map <A-=> :vertical resize+5 <CR> 
map <A--> :vertical resize-5 <CR> 
map <A-+> :resize+5 <CR> 
map <A-_> :resize-5 <CR> 
map <A-h> <C-w>h
map <A-j> <C-w>j
map <A-k> <C-w>k
map <A-l> <C-w>l
map sv <C-w>t<c-W>H
map sv <C-w>t<c-W>K
map tu :tabe<CR>
map tc :tabc<CR>
map tp :-tabnext<CR>
map tn :+tabnext<CR>
map tmn :-tabmove<CR>
map tmi :+tabmove<CR>
inoremap <C-l> <Right>
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


map rc : e $HOME\_vimrc<CR>


