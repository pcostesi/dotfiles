" must be first, changes behaviour of other settings
set nocompatible              " be iMproved, required

" sane text files
set fileformat=unix
set encoding=utf-8

" sane tabs
set tabstop=8
set shiftwidth=4
set softtabstop=4

" convert all typed tabs to spaces
set expandtab

filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

source ~/.vim/vundle-imports.vim

call vundle#end()            " required
filetype plugin indent on    " required

set encoding=utf-8

let g:Powerline_symbols = 'fancy'
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup


set t_Co=256 " force vim to use 256 colors
let g:solarized_termcolors=16 " use solarized 256 fallback
set background=dark
colorscheme solarized

" syntax highlighting
syntax on

"make sure highlighting works all the way down long files
autocmd BufEnter * :syntax sync fromstart


" shift plus movement keys changes selection
set keymodel=startsel,stopsel

" allow cursor to be positioned one char past end of line
" and apply operations to all of selection including last char
set selection=exclusive

" allow backgrounding buffers without writing them
" and remember marks/undo for backgrounded buffers
set hidden

" Keep more context when scrolling off the end of a buffer
set scrolloff=3

" allow cursor keys to go right off end of one line, onto start of next
set whichwrap+=<,>,[,]
" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" no line wrapping
set nowrap

" line numbers
set relativenumber
set number

" when joining lines, don't insert two spaces after punctuation
set nojoinspaces

" Make searches case-sensitive only if they contain upper-case characters
set ignorecase
set smartcase
" show search matches as the search pattern is typed
set incsearch
" search-next wraps back to start of file
set wrapscan
" highlight last search matches
set hlsearch
" map key to dismiss search highlightedness
map <bs> :noh<CR>

" map leader to a less RSI-prone shortcut
let mapleader = ","

" grep for word under cursor
noremap <Leader>g :grep -rw '<C-r><C-w>' .<CR>

" map F3 to search jump thru grep results from copen
map <F3> :cnext<CR>

" ctrl-s to save
map <C-s> :w<CR>
map! <C-s> <Esc>:w<CR>

" make tab completion for files/buffers act like bash
set wildmenu


" display cursor co-ords at all times
set ruler
set cursorline

" display number of selected chars, lines, or size of blocks.
set showcmd

" show matching brackets, etc, for 1/10th of a second
set showmatch
set matchtime=1


" enables filetype specific plugins
filetype plugin on
" enables filetype detection
filetype on

filetype plugin indent on

if has("autocmd")
    " Enable file type detection.
    " Use the default filetype settings, so that mail gets 'tw' set to 72,
    " 'cindent' is on in C files, etc.
    " Also load indent files, to automatically do language-dependent indenting.
    filetype plugin indent on

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

    autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
else
    " if old vim, set vanilla autoindenting on
    set autoindent

endif " has("autocmd")


" enable automatic yanking to and pasting from the selection
set clipboard+=unnamed



" places to look for tags files:
set tags=./tags,tags
" recursively search file's parent dirs for tags file
" set tags+=./tags;/
" recursively search cwd's parent dirs for tags file
set tags+=tags;/

"autocompletion
inoremap <c-space> <c-n>
inoremap <c-s-space> <c-p>

" always show statusbar
set laststatus=2

" autorezise windows
let &winheight = &lines * 7 / 10
let &winwidth = &columns * 7 / 10
let &winminwidth = 5
map <C-w><C-w> <C-w>w<C-w>=

" Syntastic
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_wq = 1
" let g:syntastic_auto_jump=1
let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'
let g:syntastic_python_checkers=['pylint']

" Ctrl P
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" Git Gutter
let g:gitgutter_signs=1
" let g:gitgutter_highlight_lines = 1
set updatetime=750

" Nerd Tree
" autocmd vimenter * if !argc() | NERDTree | endif
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
map <C-n> :NERDTreeToggle<CR>
let g:ackprg = 'ag --nogroup --nocolor --column'


set colorcolumn=72,79,100

" highlight excess lines
highlight OverLength79 ctermbg=0 ctermfg=1
highlight OverLength100 ctermbg=1 ctermfg=11

mat OverLength79 /\%80v.*/
2mat OverLength100 /\%101v.*/

au FileType * IndentGuidesDisable
au FileType python IndentGuidesEnable

" let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
hi IndentGuidesOdd ctermbg=0
hi IndentGuidesEven ctermbg=0

