"This change exists on laptop vimrc but not online backups
"This change is to save vim folds after exiting too
augroup remember_folds
  autocmd!
  autocmd BufWinLeave * mkview
  autocmd BufWinEnter * silent! loadview
augroup END

"Note install git, gcc, python,make and obviously vim beforehand
"Note, install curl and then install VimPlugin
"VIM PLUG PLUGIN CALL AND END. SEE GITHUB REPO FOR INFO
call plug#begin('~/.vim/plugged')

"To copy and paste from and to system. use cp to copy, cv to paste. 
"Supports motions and directions too after cp or cv command
"use cP or cV to copy whole line or paste to next line
"Note that xsel is required. Install by - sudo apt install xsel
Plug 'christoomey/vim-system-copy'

"Syntastic plugin, see github repo for detailed help or from within vim type
":help syntastic
"to get help
Plug 'vim-syntastic/syntastic'

call plug#end()

"Following set of lines is for syntastic plugin
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"validator was preinstalled this activates it
let g:syntastic_html_checkers = ['validator']
"Install NodeJS, npm and then ESlint globally. Then do eslint --init to start
let g:syntastic_javascript_checkers = ['eslint']

"COLORS
syntax on
colorscheme molokai
"colorscheme badwolf
"let g:badwolf_darkgutter = 1


"TABS AND SPACES
set tabstop=8   "number of visual spaces per tab
set softtabstop=4   "no of spaces in tab when editing
set shiftwidth=4
set noexpandtab 		"tabs are spaces


"GRAPHICAL
set number
set showcmd
set noequalalways
" Enable CursorLine
set cursorline
" Default Colors for CursorLine
highlight  CursorLine ctermbg=234 ctermfg=None
" Change Color when entering Insert Mode
autocmd InsertEnter * highlight  CursorLine ctermbg=238 ctermfg=None
" Revert Color to default when leaving Insert Mode
autocmd InsertLeave * highlight  CursorLine ctermbg=234 ctermfg=None
set wildmenu
set lazyredraw
set showmatch
filetype indent on


"TABS
map <C-l> :tabn<cr>
map <C-h> :tabp<cr>


"SEARCHING
set incsearch
set hlsearch
nnoremap <leader><space> :nohlsearch<CR>


"FOLDING
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
" space open/closes folds
nnoremap <space> za
set foldmethod=indent   " fold based on indent level


"MOVEMENT
" move vertically by visual line
nnoremap j gj
nnoremap k gk

