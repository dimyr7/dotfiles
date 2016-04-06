" use this vimrc, not the system wide
set nocompatible

" turn on syntax highlighting based on file type
filetype on

" adding to run time path
set rtp+=~/.vim/bundle/Vundle.vim

"Cool Plugins
call vundle#begin()
Plugin 'gmarik/Vundle.vim' 					" Plugin Installer
Plugin 'scrooloose/nerdtree'				" File system explorer
Plugin 'majutsushi/tagbar'					" Tag generator
Plugin 'Valloric/YouCompleteMe'				" Autocompletion engine
"Plugin 'scrooloose/syntastic'
Plugin 'ntpeters/vim-better-whitespace'  	" Better whitespace
Plugin 'airblade/vim-gitgutter'
Plugin 'rdnetto/YCM-generator'
"Plugin 'bling/vim-airline'
"Plugin 'bling/vim-bufferline'
"Plugin 'vim-airline/vim-airline-themes'
Plugin 'mkitt/tabline.vim'
"Plugin 'octol/vim-cpp-enhanced-highlight'	" Better C++ highlighting
"Plugin 'altercation/vim-colors-solarized' 	" Solarized theme
call vundle#end()

" Indent, highlighting, and searching
filetype plugin indent on
syntax enable
set smartindent
set tabstop=4								" How many columns 1 tab is
set shiftwidth=4							" How many columns << or >> does
set smarttab								" Spaces are more like tabs
set hidden									" An unsaved buffer will be hidden
set showmatch								" Highlughts matching parenthesis
set ignorecase 								" Ignore case when searching
set smartcase								" Ignore case unless capitalized
set hlsearch								" Highligh search results
set wrapscan               					" Searches wrap around end-of-file.
set incsearch								" Starts searching incrementally by letter
set autoindent								" Next line will have the same indent as before
set shiftround								" Round indent to multiple of shiftwidth
set cursorline             					" Find the current line quickly.
set backspace   =indent,eol,start  			" Make backspace work as you would expect.




" Other
set number									" Line numbers are set
set ruler
set scrolloff=5								" number of rows kept above/below the cursor
set title
set noerrorbells
set laststatus=2
set splitbelow
set splitright
set showmode               					" Show current mode in command-line.
set showcmd              					" Show already typed keys when more are expected.
set ttyfast									" Fast re-rendering
set lazyredraw
"Cursor
highlight Cursor guifg=white guibg=black
highlight iCurson guifg=white guibg=steelblue
"set lazyredraw             					" Only redraw when necessary


" Remap header
let mapleader=","
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Normal mode remaps
nnoremap ; :
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>

nnoremap <C-N> :NERDTreeToggle<CR>
nnoremap <leader>tt :TagbarToggle<CR>
nnoremap =j :%!python -m json.tool<CR>

" Insert mode remaps
inoremap jk <ESC>
inoremap {} {}<Left><Enter><Enter><Up><Tab>



" YCM for C-Family languages
"let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_server_use_vim_stdout =1
let g:ycm_confirm_extra_conf = 0
let g:ycm_server_log_level = 'debug'
let g:ycm_auto_trigger = 1
"let g:ycm_complete_in_strings = 1
"let g:ycm_echo_current_diagnostic=1

" Set solarized theme
syntax enable
set background=dark
colorscheme solarized

" NERDTree will exit if it is the last open window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

autocmd FileType c nnoremap <buffer> <silent> <C-]> :YcmCompleter GoTo<cr>

" Highlight extra whitespace
highlight ExtraWhitespace ctermbg=red

"Better C++ Highlighting
"let g:cpp_class_scope_highlight = 1
"let g:cpp_experimental_template_highlight = 1

" Vim tabs

" Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_cpp_compiler="clang++"
let g:syntastic_cpp_compiler_options="-std=c++11 -stdlib=libc++"

"Airline
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'
"let g:airline_theme='wombat'

"bufferline
"let g:bufferline_echo = 0
"autocmd VimEnter *
"  \ let &statusline='%{bufferline#refresh_status()}'
"    \ .bufferline#get_status_string()
