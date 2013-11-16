" must be first, changes behaviour of other settings
set nocompatible

set encoding=utf-8
execute pathogen#infect()

:filetype plugin on

let g:Powerline_symbols = 'fancy'

filetype plugin indent on


set t_Co=256 " force vim to use 256 colors
let g:solarized_termcolors=16 " use solarized 256 fallback
set background=dark
colorscheme solarized

" sane text files
set fileformat=unix
set encoding=utf-8

" sane tabs
set tabstop=4
set shiftwidth=4
set softtabstop=4

" convert all typed tabs to spaces
set expandtab

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

set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
execute pathogen#infect("~/.vim/bundle/powerline/powerline/bindings/vim/{}")

