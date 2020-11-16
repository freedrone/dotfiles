call plug#begin('~/.vim/plugged')

Plug 'Valloric/YouCompleteMe'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'StanAngeloff/php.vim'
Plug 'majutsushi/tagbar'
Plug 'itchyny/lightline.vim'
Plug 'airblade/vim-gitgutter'
Plug 'fatih/vim-go'
Plug 'rhysd/vim-go-impl'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-surround'
Plug 'scrooloose/syntastic'
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-fugitive'
Plug 'jwalton512/vim-blade'
Plug 'honza/vim-snippets'
Plug 'mileszs/ack.vim'
Plug 'beanworks/vim-phpfmt'
Plug 'scrooloose/nerdcommenter'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'editorconfig/editorconfig-vim'
Plug 'SirVer/ultisnips'

if has('mac')
    let s:python_loc = "/usr/local/bin/python3"
endif
if has('linux')
    let s:python_loc = "/usr/bin/python3"
endif

" Add plugins to &runtimepath
call plug#end()

syntax on
filetype plugin indent on
set number
set norelativenumber
set nocompatible 
set t_Co=256
set mouse=a
syntax enable
" colorscheme monokai

set guifont=Monaco\ for\ Powerline:h16
set linespace=12
set tabstop=4
set smarttab
set showmode
set tags=tags
set softtabstop=4 
set expandtab  
set shiftwidth=4
set shiftround
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set autoindent                  " always set autoindenting on
set copyindent                  " copy the previous indentation on autoindenting
set ignorecase                  " ignore case when searching
set smartcase                   " ignore case if search pattern is all lowercase,
set timeout timeoutlen=200 ttimeoutlen=100
set visualbell           " don't beep
set noerrorbells         " don't beep
set autowrite  "Save on buffer switch
set showcmd
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set noswapfile
set clipboard=unnamed
set wildignore+=*/vendor/**         " I don't want to pull up these folders/files when calling CtrlP
set wildignore+=*/public/**         " I don't want to pull up these folders/files when calling CtrlP 
set wildignore+=*/node_modules/**   " I don't want to pull up these folders/files when calling CtrlP
set ttymouse=sgr "mouse support for fullscreen

let mapleader = ","
let g:mapleader = ","
let g:EasyMotion_leader_key = '<Leader>'


" Vim-Markdown
let g:vim_markdown_folding_disabled = 1 "markdown folding

" NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let NERDTreeShowHidden=1
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" Mappings
nmap :sp :rightbelow sp<cr>
nmap vs :vsplit<cr>
nmap sp :split<cr>
nmap :bp :BufSurfBack<cr>
nmap :bn :BufSurfForward<cr>
nmap <C-b> :NERDTreeToggle<cr>
nmap <leader>w :w!<cr>
nmap <leader>q :q<cr>
nmap <leader>qa :qa<cr>
nmap <leader>q! :q!<cr>
nmap <leader>gca :Gcommit -a -S<cr>
nmap <leader>gp :Gpush<cr>
nmap <leader>gl :Gpull<cr>
nmap <leader>gst :Gstatus<cr>

nnoremap j gj 
nnoremap k gk
imap jj <esc>

" tagbar
nmap <F8> :TagbarToggle<CR>

"Auto change directory to match current file ,cd
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>

" Familiar commands for file/symbol browsing
map <D-p> :CtrlP<cr> 
map <C-r> :CtrlPBufTag<cr>

"Powerline
let g:Powerline_symbols = 'fancy'
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)

" Search
autocmd cursorhold * set nohlsearch
autocmd cursormoved * set hlsearch
set incsearch
highlight Search cterm=underline
command! H let @/="" " Remove search results
autocmd BufWritePre *.php :%s/\s\+$//e

" do not continue comments 
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled=1

"syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_html_checkers=['']
let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
let g:syntastic_aggregate_errors = 1
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe = '$(npm bin)/eslint'
let g:syntastic_php_phpcs_exec = './vendor/bin/phpcs'
let g:syntastic_php_phpmd_exec = './vendor/bin/phpmd'
let g:syntastic_php_phpcs_args = '--standard=PSR2'

" Tagbar
let g:tagbar_type_php  = {
            \ 'ctagstype' : 'php',
            \ 'kinds'     : [
            \ 'i:interfaces',
            \ 'c:classes',
            \ 'd:constant definitions',
            \ 'f:functions',
            \ 'j:javascript functions:1'
            \ ]
            \ }

" Gitgutter
let g:gitgutter_max_signs = 2000
let g:ragtag_global_maps = 1 

"phpfmt
let g:phpfmt_on_save = get(g:, 'phpfmt_on_save', 1)
let g:phpfmt_php_path = "php"
let g:phpfmt_enable_default_mapping = 1

"vim-jsx (react)
let g:jsx_ext_required = 0

"YCM
let g:ycm_server_python_interpreter = s:python_loc
let g:ycm_path_to_python_interpreter = s:python_loc
let g:ycm_autoclose_preview_window_after_completion = 1

"Vim-go
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)

autocmd BufNewFile,BufRead *.blade.php set ft=html | set ft=phtml | set ft=blade " Fix blade auto-indent"

" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Tips & Tricks. 

" General 
" Select anything inside two things like '' or () type vi' or vi( You can change the thing inside of two things with ci' or delete it with di' 
" m{key} to bookmark some line and `{key} to move to that bookmark
" P to paste above, p to paste below. yy to yank line, dd to delete line. 

" Moving around
" N line above : nk
" N line below : nj
" Go to Nth line: NG
" CTRL E : scroll window
" CTRL Y: scroll up
" H: move cursor to top
" M: move cursor to the Middle
" L: move cursor to the bottom of the window
" w:move one word
" b: move one word backwords
" e: move one word at the end of the word
" I : set insert mode at the beginning of the line
" A: set insert mode at the end of the line
" zz to center the file

" Ctags 
" :tag -> searches 
" :!ctags -R -> regens 
" :tn -> next tag
" :ts -> select tag from list
" :tp -> prev tag
" gd will take you to the local declaration.
" gD will take you to the global declaration.
" g* search for the word under the cursor (like *, but g* on 'rain' will find words like 'rainbow').
" g# same as g* but in backward direction.
" g] and other commands will jump to a tag definition (a tag can be a function or variable name, or more).

" Complete 
" CTRL X -> completion mode
" + CTRL o -> complete language methods
" + CTRL l -> complete line 
" + CTRL f -> complete filename
" CTRL p -> word complete previous
" CTRL n -> word complete next 

" Search & Replace 
" :s/{search}/{replace} for single line :s% for whole file. 
