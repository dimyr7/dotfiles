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
Plugin 'Valloric/YouCompleteMe'				" Autocompletion engine
Plugin 'ntpeters/vim-better-whitespace'  	" Better whitespace
Plugin 'airblade/vim-gitgutter'
Plugin 'rdnetto/YCM-generator'
Plugin 'altercation/vim-colors-solarized' 	" Solarized theme
Plugin 'zhaocai/GoldenView.vim'
Plugin 'majutsushi/tagbar'					" Tag generator
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"Plugin 'bling/vim-bufferline'
"Plugin 'mkitt/tabline.vim'
"Plugin 'jceb/vim-orgmode'
Plugin 'tpope/vim-fugitive'
Plugin 'ludwig/split-manpage.vim'
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
set vb 										" Set visual bell

" Other
set number									" Line numbers are set
set ruler
set scrolloff=10							" number of rows kept above/below the cursor
set title
set noerrorbells
set laststatus=2
set splitbelow
set splitright
set showmode               					" Show current mode in command-line.
set showcmd              					" Show already typed keys when more are expected.
set ttyfast									" Fast re-rendering
set lazyredraw             					" Only redraw when necessary
"Cursor
highlight Cursor  guifg=white guibg=black
highlight iCurson guifg=white guibg=steelblue


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
nnoremap <NUL> i<Space><Esc>
nnoremap <leader>m :SwitchGoldenViewToggle<CR>:EnableGoldenViewAutoResize<CR>
nnoremap <leader>s <S-a>;<Esc>
nnoremap <leader>c <S-a>,<Esc>

nnoremap <leader><Tab>   :tabn<CR>
nnoremap <leader><S-Tab> :tabp<CR>

" Open up the NERDTree
nnoremap <C-N> :NERDTreeToggle<CR>

" Open up the TagBar
nnoremap <leader>tt :TagbarToggle<CR>
nnoremap <leader>tp :TagbarTogglePause<CR>

" Format file in JSON format
nnoremap =j :%!python -m json.tool<CR>

" Decrement and Increment
nnoremap <leader>d <C-x>
nnoremap <leader>f <C-a>

" Git Gutter remaps
nnoremap <leader>gp <Plug>>GitGutterPreviewHunk
nnoremap <leader>gr <Plug>GitGutterRevertHunk
nnoremap <leader>gs <Plug>GitGutterStageHunk


nnoremap <leader>ws :StripWhitespace<CR>:w<CR>


" Insert mode remaps
inoremap jk <ESC>
inoremap {} {}<Left><Enter><Enter><Up><Tab>



" YCM for C-Family languages
let g:ycm_server_use_vim_stdout =1
let g:ycm_confirm_extra_conf = 0
let g:ycm_server_log_level = 'debug'
let g:ycm_auto_trigger = 1
let g:ycm_complete_in_strings = 1
let g:ycm_echo_current_diagnostic=1

" Set solarized theme
syntax enable
set background=dark
colorscheme solarized

" NERDTree will exit if it is the last open window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

autocmd FileType c nnoremap <buffer> <silent> <C-]> :YcmCompleter GoTo<cr>

" Highlight extra whitespace
highlight ExtraWhitespace ctermbg=red


" Airline
let g:airline_theme='base16'
let g:airline_powerlire_fonts=1
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.readonly= '🔒'
let g:airline_symbols.branch = ''

function! AirlineInit()
	" Vim mode, read only, paste mode
	let g:airline_section_a = airline#section#create_left(['mode','crypt','paste'])
	" Github branch, numer of additions/deletions/modifications
	let g:airline_section_b = airline#section#create_left(['branch', 'hunks'])
	" Filename, moddified
	let g:airline_section_c = airline#section#create(['%f',' ', '%m' ])

	" Name of scope
	let g:airline_section_x = airline#section#create(['tagbar'])
	" Percentage of downscrolled
	let g:airline_section_y = airline#section#create(['%P'])
	" line number, column number
	let g:airline_section_z = airline#section#create_right(['%l', '%c'])
	" Error if YCM error
	let g:airline_section_error = airline#section#create(['ycm_error_count'])
	"Warning if YCM warning or whitespace
	let g:airline_section_warning = airline#section#create(['ycm_warning_count', 'whitespace'])
endfunction
autocmd VimEnter * call AirlineInit()

" Airline - Tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#whitespace#mixed_indent_algo = 1
"let timeoutlen=1


"bufferline
"let g:airline#expensions#buggerline#enabled=1
"autocmd VimEnter *
"  \ let &statusline='%{bufferline#refresh_status()}'
"    \ .bufferline#get_status_string()


" Goldenview
let g:goldenview__enable_default_mapping = 0
