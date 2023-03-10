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
"               ????????????                        "
"-----------------------------------------------"
"Plugin 'https://hub.fastgit.org/??????/???????????????.git
call plug#begin('~/.vim/plugged')
Plug 'https://hub.fastgit.org/dracula/vim',{'as':'dracula'}
Plug 'https://hub.fastgit.org/mbbill/undotree'
Plug 'https://hub.fastgit.org/preservim/nerdtree'
Plug 'https://hub.fastgit.org/Yggdroot/LeaderF', { 'do': './install.sh' }   "<leader>f
Plug 'https://hub.fastgit.org/sillybun/vim-autodoc'
" ?????????????????????docstring
":RecordParameter
" ?????????????????????????????????docstring
":RecordCurrentFunction
Plug 'https://hub.fastgit.org/dense-analysis/ale'                   "????????????
Plug 'https://hub.fastgit.org/python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
Plug 'https://hub.fastgit.org/preservim/nerdcommenter'              "num/cc num/cu num/ci
Plug 'https://hub.fastgit.org/neoclide/coc.nvim', {'branch': 'release'}
Plug 'https://hub.fastgit.org/honza/vim-snippets'
Plug 'https://hub.fastgit.org/jiangmiao/auto-pairs'
Plug 'https://hub.fastgit.org/vim-airline/vim-airline'
Plug 'https://hub.fastgit.org/vim-airline/vim-airline-themes'
Plug 'https://hub.fastgit.org/rust-lang/rust.vim'
Plug 'https://hub.fastgit.org/majutsushi/tagbar'
Plug 'https://hub.fastgit.org/godlygeek/tabular' "????????????????????????vim-markdown??????
Plug 'https://hub.fastgit.org/plasticboy/vim-markdown'
Plug 'https://hub.fastgit.org/iamcco/mathjax-support-for-mkdp'
Plug 'https://hub.fastgit.org/iamcco/markdown-preview.vim'
call plug#end()


"-----------------------------------------------"
"               ???????????????                      "
"-----------------------------------------------"
colorscheme dracula
"hi Normal ctermfg=252 ctermbg=none
hi pythonSelf ctermfg=174 guifg=#6094DB cterm=bold gui=bold

" auto pair--------------------
au Filetype FILETYPE let b:AutoPairs = {"(": ")"}
au FileType php      let b:AutoPairs = AutoPairsDefine({'<?' : '?>', '<?php': '?>'})

" markdown---------------------
let g:vim_markdown_math = 1
nmap <silent> <F8> <Plug>MarkdownPreview
let g:mkdp_path_to_chrome = "/opt/google/chrome"
imap <silent> <F8> <Plug>MarkdownPreview
nmap <silent> <F9> <Plug>StopMarkdownPreview
imap <silent> <F9> <Plug>StopMarkdownPreview

"airline ----------------------
set laststatus=2  "?????????????????????
let g:airline_powerline_fonts = 1  " ?????? powerline ??????
let g:airline_extensions_tabline_enabled = 1  "????????????tab???buffer
let g:airline_theme='molokai'  " murmur????????????

"????????????????????????
let g:airline#extensions#wordcount#enabled = 0
"????????????????????????Windows?????????
let g:airline#parts#ffenc#skip_expected_string='utf-8[dos]'
"??????tagber??????markdown?????????
let g:tagbar_type_markdown = {
    \ 'ctagstype' : 'markdown',
    \ 'kinds' : [
        \ 'h:Chapter',
        \ 'i:Section',
        \ 'k:Paragraph',
        \ 'j:Subparagraph'
    \ ]
\ }
"????????????warning??????
let g:airline_section_warning = ''
"????????????section_b
let g:airline_section_b = ''
"section_c?????????tagbar?????????????????????
let g:airline_section_c = airline#section#create(['tagbar'])
"section_x???????????????
let g:airline_section_x = '%{expand("%")}'
"section_y????????????
let g:airline_section_y = airline#section#create(['%{strftime("%D")}'])
"section_z????????????
let g:airline_section_z = airline#section#create(['%{strftime("%H:%M")}'])
"??????tagbar??????
let g:airline#extensions#tagbar#enabled = 1

"if !exists('g:airline_symbols')
"let g:airline_symbols = {}
"endif
"let g:airline_left_sep = '???'
"let g:airline_left_alt_sep = '???'
"let g:airline_right_sep = '???'
"let g:airline_right_alt_sep = '???'
"let g:airline_symbols.linenr = '??'
"let g:airline_symbols.branch = '???'

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

" ???????????????-------------------------
map RR :!cargo run<CR>
map rr :RustRun<CR>

map ff :NERDTreeToggle<CR>
map <F5> :UndotreeToggle<CR>
"map rc : e $HOME\_vimrc<CR>        "windows
"inoremap <esc> <nop>                "???esc????????????
"inoremap ;k <esc>                   "?????????????????????jk?????????esc

"""""""coc.nvim configuration>>>>>""""""""

" May need for Vim (not Neovim) since coc.nvim calculates byte offset by count
" utf-8 byte sequence
"set encoding=utf-8
" Some servers have issues with backup files, see #649
"set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s)
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying code actions to the selected code block
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying code actions at the cursor position
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
nmap <leader>as  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap keys for applying refactor code actions
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" Run the Code Lens action on the current line
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> to scroll float windows/popups
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges
" Requires 'textDocument/selectionRange' support of language server
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

"""""""<<<<<<coc.nvim configuration""""""""

"-----------------------------------------------"
"               ????????????                        "
"-----------------------------------------------"
set selection=exclusive
set selectmode=mouse,key
set termguicolors               "24bit colors
set ic
set fileencodings=utf-8,ucs-bom,GB2312,big5
set number
"set relativenumber
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
set listchars=tab:???\ ,trail:???
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
