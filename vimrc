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
Plugin 'Valloric/YouCompleteMe'				" Auto completion
Plugin 'ntpeters/vim-better-whitespace'  	" Highlights extra whitespace at the end of a line
Plugin 'airblade/vim-gitgutter'				" Shows git diff changes
Plugin 'zhaocai/GoldenView.vim'				" Automatic window resizing
Plugin 'bling/vim-airline'					" Status bar at the bottom
Plugin 'vim-airline/vim-airline-themes'		" Themes for airline
Plugin 'majutsushi/tagbar'					" Generate tags to view in vim
Plugin 'mkitt/tabline.vim'					" Tabs have more info
Plugin 'tpope/vim-fugitive'
Plugin 'ludwig/split-manpage.vim'
Plugin 'lambdalisue/vim-manpager'
Plugin 'vim-scripts/AnsiEsc.vim'
"Plugin 'terryma/vim-multiple-cursors'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'wesQ3/vim-windowswap'
Plugin 'gcmt/taboo.vim'
Plugin 'vim-scripts/scrollfix'
Plugin 'tpope/vim-eunuch'
Plugin 'mileszs/ack.Vim'
Plugin 'junegunn/fzf'
"Plugin 'rdnetto/YCM-generator'
call vundle#end()

so ~/.vimrc_airline
let g:airline_section_z = airline#section#create_right(['%l/%L', '%c', '%p%%']) " line number, column number
let g:airline_section_error = airline#section#create(['ycm_error_count'])
let g:airline_section_warning = airline#section#create(['ycm_warning_count', 'whitespace'])


" Indent, highlighting, and searching
filetype plugin indent on
set noexpandtab 							" In insert mode, don't convert tab characters to spaces
set smartindent 							" An indent is added in certain cases
set tabstop=4								" How many columns 1 tab is
set shiftwidth=4							" How many columns << or >> does
set smarttab								" Spaces are more like tabs
set hidden									" An unsaved buffer will be hidden
set ignorecase 								" Ignore case when searching
set smartcase								" Ignore case unless capitalized
set hlsearch								" Highligh search results
set wrapscan               					" Searches wrap around end-of-file.
set incsearch								" Starts searching incrementally by letter
set autoindent								" Next line will have the same indent as before
set shiftround								" Round indent to multiple of shiftwidth
set cursorline             					" Find the current line quickly.
set backspace   =indent,eol,start  			" Make backspace work as you would expect.
set cindent
set cino=g0
set colorcolumn=120
highlight ColorColumn ctermbg=red


" Other
set number									" Line numbers are set
set ruler
set scrolloff=50							" number of rows kept above/below the cursor
set title
set noerrorbells
set laststatus=2
set splitbelow
set splitright
set showmode               					" Show current mode in command-line.
set showcmd              					" Show already typed keys when more are expected.
set ttyfast									" Fast re-rendering
set lazyredraw             					" Only redraw when necessary

" Folding
set foldmethod=syntax
set nofoldenable

" Set solarized theme
syntax enable
set background=dark

" Colors TODO
highlight Search cterm=Bold ctermfg=Black ctermbg=Yellow gui=Bold guifg=Black guibg=Yellow
highlight CursorLine term=Bold cterm=Bold ctermbg=DarkGrey
highlight DiffAdd ctermfg=White ctermbg=Blue guifg=White guibg=Blue
highlight DiffDelete ctermfg=White ctermbg=Red
highlight DiffChange ctermfg=Black ctermbg=Green
highlight DiffText ctermfg=Black ctermbg=Cyan
highlight InsertText ctermfg=Black
highlight Folded ctermfg=White ctermbg=DarkGrey
highlight ExtraWhitespace ctermbg=red
highlight Todo cterm=inverse ctermfg=Yellow ctermbg=Black gui=Bold guifg=Black guibg=Yellow
highlight MatchParen ctermfg=White ctermbg=Blue guifg=White guibg=Blue
highlight WarningMsg ctermfg=White ctermbg=Red
highlight SpellBad ctermbg=Red ctermfg=white term=underline
"highlight SpellBad ctermbg=Red ctermfg=black



" Remap header
let mapleader=","
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Normal mode remaps
" Use ; instead of :
nnoremap ; :
" Shortcut for switching windows
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
" Insert space, semicolon, colon, comma, newline
nnoremap <leader><space> i<Space><Esc>
nnoremap <leader>s <S-a>;<Esc>
nnoremap <leader>c <S-a>,<Esc>
nnoremap <leader>r i<CR><Esc>^
nnoremap <leader><S-c> <S-a>:<Esc>:

" Search word
nnoremap <leader>sw yeq/p<CR>N

" Paths
cnoremap <leader>vi ~/code/BarKeep/libview/include/libview/
cnoremap <leader>vd ~/code/BarKeep/libview/src/
cnoremap <leader>bi ~/code/BarKeep/libbarkeeper/include/libbarkeeper/
cnoremap <leader>bd ~/code/BarKeep/libbarkeeper/src/
cnoremap <leader>ji ~/code/BarKeep/libjigger/include/libjigger/
cnoremap <leader>jd ~/code/BarKeep/libjigger/src/
cnoremap <leader>ii ~/code/BarKeep/libimporter/include/libimporter/
cnoremap <leader>id ~/code/BarKeep/libimporter/src/


nnoremap <leader><Tab>   :tabn<CR>
nnoremap <leader><S-Tab> :tabp<CR>

" Open up the NERDTree
nnoremap <leader>n :NERDTreeFocus<CR>

" Open up the TagBar
nnoremap <leader>tt :TagbarOpen<CR><C-w><C-b>
nnoremap <leader>tp :TagbarTogglePause<CR>
let g:tagbar_ctags_bin = "/Users/dimyr7/bin/ctags"

" Format file in JSON format
nnoremap =j :%!python -m json.tool<CR>

" Decrement and Increment
nnoremap <leader>d <C-x>
nnoremap <leader>f <C-a>

" Git Gutter remaps
nnoremap <leader>gp :GitGutterPreviewHunk<CR>
nnoremap <leader>gr :GitGutterUndoHunk<CR>
nnoremap <leader>gs :GitGutterStageHunk<CR>
nmap ]g ]c
nmap [g [c

" Helpful things to search for
nnoremap <leader>gm /^\(<<<<<<<\\|=======\\|>>>>>>>\)<CR>



nnoremap <leader>ws :StripWhitespace<CR>:w<CR>


" Insert mode remaps
inoremap jk <ESC>
inoremap {} {}<Left><Enter><Enter><Up><Tab>

vnoremap // y/<C-R>"<CR>


" YCM for C-Family languages
let g:ycm_server_use_vim_stdout =1
let g:ycm_confirm_extra_conf = 0
let g:ycm_server_log_level = 'debug'
let g:ycm_auto_trigger = 1
let g:ycm_complete_in_strings = 1
let g:ycm_echo_current_diagnostic=1
let g:ycm_filepath_completion_use_working_dir=1
let g:ycm_collect_identifiers_from_tags_files=1


" NERDTree will exit if it is the last open window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

autocmd FileType cpp nnoremap <buffer> <silent> <C-]> :YcmCompleter GoTo<cr>

"let timeoutlen=1

"ag
let g:ackprg = 'ag --nogroup --nocolor --column'


" Goldenview
let g:goldenview__enable_default_mapping = 0


" Manpage
let g:split_manpage_prefix = '<leader>k'
let g:split_manpage_samewindow = '<leader>K'

highlight airline_warning ctermfg=White

let @a = "// =================================================================================================================\n"
" Don't indent namespace and template
function! CppNoNamespaceAndTemplateIndent()
	echom "here2"
	let l:current_line_num = line('.')
	let l:current_line = getline(l:current_line_num)
	let l:prev_line_num = prevnonblank(l:current_line_num - 1)
	let l:prev_line = getline(l:prev_line_num)
	while l:prev_line =~# '\(^\s*{\s*\|^\s*//\|^\s*/\*\|\*/\s*$\)'
		let l:prev_line_num = prevnonblank(l:prev_line_num - 1)
		let l:prev_line = getline(l:prev_line_num)
	endwhile
	let l:retv = cindent('.')
	let l:prev_indent = indent(l:prev_line_num)
	if l:prev_line =~# '^\s*template.*$'
		let l:retv = l:prev_indent
	elseif l:prev_line =~# '\s*,?\s*typename\s*.*,?'
		let l:retv = l:prev_indent
	elseif l:current_line =~# '^\s*>\s*$'
		let l:retv = l:prev_indent - &shiftwidth
	elseif l:prev_line =~# '\s*, typename\s*.*>\s*$'
		let l:retv = l:prev_indent - &shiftwidth
	elseif l:prev_line =~# '^\s*namespace.*'
		let l:retv = 0
	endif
	return l:retv
endfunction



"autocmd BufEnter *.{cc,cxx,cpp,h,hh,hpp,hxx} setlocal indentexpr=CppNoNamespaceAndTemplateIndent()
autocmd BufEnter *.sql.mako set syntax=sql

autocmd BufNewFile,BufRead,BufEnter *.tpp set syntax=cpp
autocmd BufNewFile,BufRead,BufEnter *.h.mako set syntax=cpp
autocmd BufWritePost * GitGutter
let g:scrollfix=40
"autocmd VimEnter * AnsiEsc
nmap <F2> :call <SID>SynStack()<CR>
function! <SID>SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
