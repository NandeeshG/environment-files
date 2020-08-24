"USE THIS IF YOU WANT VIMRC STUFF IN HERE
"set runtimepath^=~/.vim runtimepath+=~/.vim/after
"let &packpath = &runtimepath
"source ~/.vimrc


"1. ssh key generation and addition required in git
"2. git global credentials setting
"3. check usernames
"4. deoplete-plugins not zchee
"5. add neovim-ppa/stable and the apt-get update
"6. add pip,pip3,pynvim and update them all
"7.
"Note install git, gcc, python,make and obviously vim beforehand
"Note, install curl and then install VimPlugin
"VIM PLUG PLUGIN CALL AND END. SEE GITHUB REPO FOR INFO
let plugged_path_myvar = '~/.config/nvim/plugged'
call plug#begin(plugged_path_myvar)

	if has('nvim')
		Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
	else
		Plug 'Shougo/deoplete.nvim'
		Plug 'roxma/nvim-yarp'
		Plug 'roxma/vim-hug-neovim-rpc'
	endif

	"1. Install jedi from pip and pip3
	Plug 'deoplete-plugins/deoplete-jedi'

	"1. Install clang
	Plug 'Shougo/deoplete-clangx'

	"Color schemes, install and run simple
	Plug 'kyoz/purify', { 'rtp': 'vim' }  "NOICE
	Plug 'Badacadabra/vim-archery'  "NOICE
	Plug 'ajmwagar/vim-deus'
	Plug 'tyrannicaltoucan/vim-deep-space'
	Plug 'whatyouhide/vim-gotham'  "NOICE
	Plug 'morhetz/gruvbox'      "NOIIIICE FEATUREFUL AAWESOME
	Plug 'nanotech/jellybeans.vim'  "NOICE
	Plug 'jonathanfilip/vim-lucius' "EASY USE, MANY MODES
	Plug 'owickstrom/vim-colors-paramount' "Minimal dark or light mode from background color

	"To copy and paste from and to system. use cp to copy, cv to paste.
    "Supports motions and directions too after cp or cv command
	"use cP or cV to copy whole line or paste to next line
	"Note that xsel is required. Install by - sudo apt install xsel
	Plug 'christoomey/vim-system-copy'

	"Syntastic plugin, see github repo for detailed help or from within vim type
	":help syntastic
	"to get help
	Plug 'vim-syntastic/syntastic'

    "Featureful statusline
    Plug 'vim-airline/vim-airline'

    Plug 'mhinz/vim-startify'

    Plug 'preservim/nerdtree'

call plug#end()

syntax on
"deoplete
let g:deoplete#enable_at_startup = 1
"Close preview window on going to insert mode, or even completing the autocomplete
"autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | silent! pclose | endif
"This closes only when you press escape(i.e. when you leave insert mode)
autocmd InsertLeave * if pumvisible() == 0 | silent! pclose | endif

"Some Graphics
set termguicolors  "Uses 256colors, first used in vim-archery. Now
                    "I use it in every colorscheme
set background=dark  "Many colorschemes automatically change, namely gruvbox, lucius, paramount
"their modes acc to this. dark or light
colorscheme jellybeans
" Lucius<Dark/Black/Light/White><null/HighContrast/LowContrast>
" This is lucius use template. Just put whatever you
" want after setting colorscheme lucius
" like as given below, just write that and it will work
"LuciusBlackHighContrast

"gruvbox specific
" let g:gruvbox_ = ''   "TEMPLATE
"let g:gruvbox_bold = '1'
"let g:gruvbox_italic = '1'
"let g:gruvbox_underline = '1'
"let g:gruvbox_contrast_dark = 'hard'
"let g:gruvbox_italicize_strings = '1'

"set showtabline=2  "TABS on top, like chrome
"set laststatus=2   "Statusline at bottom, default in nvim

"Following set of lines is for syntastic plugin
" THese three lines are off for now, maybe they'll work well with airline or
" something
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
""validator was preinstalled in my laptop
let g:syntastic_html_checkers = ['validator']
""Install NodeJS, npm and then ESlint globally. Then do
"    "eslint --init to start
let g:syntastic_javascript_checkers = ['eslint']


"OLDVIMRC COMMENT - latest addition on aug31/2019. It might not be on PC and GDrive backups of
"vimrc.
"These lines of code help by remembering the fold or unfolded state of code
augroup remember_folds
 autocmd!
 "autocmd BufWinLeave * mkview
 au BufWinLeave ?* mkview 1
 "autocmd BufWinEnter * silent! loadview
 au BufWinEnter ?* silent! loadview 1
augroup END

""""TABS AND SPACES
set tabstop=4   "number of visual spaces per tab
set softtabstop=4   "no of spaces in tab when editing
set expandtab 		"tabs are spaces
set shiftwidth=4

""""GRAPHICAL
set number
set showcmd
"""" Enable CursorLine
set cursorline
"""" Default Colors for CursorLine
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
noremap <leader><space> :nohlsearch<CR>

"FOLDING
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
" space open/closes folds
noremap <space> za
set foldmethod=indent   " fold based on indent level

"MOVEMENT
" move vertically by visual line
noremap j gj
noremap k gk

"Tried to achieve the following line's effect, but instead had to turn off
"curly bracket highlighting
"syn clear cErrInBracket
let c_no_curly_error = 1

" RUN THIS FIRST sudo apt-get install fonts-powerline
" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''


"Startify stuff
let g:startify_bookmarks = ['~/.config/nvim/init.vim']  "A list of files or directories to bookmark.
let g:startify_change_to_dir = 1
let g:startify_update_oldfiles = 0  "Update startify on-the-fly, not only on exit
let g:startify_custom_header = 'startify#center(startify#fortune#cowsay())'
autocmd VimEnter *
            \   if !argc()
            \ |   Startify
            \ |   NERDTree
            \ |   wincmd w
            \ | endif


"Custom commands
command Build ! g++ -g -Og -Wall -Wextra -pedantic-errors %:t
command Run   ! ./a.out
command Debug ! gdb ./a.out 
command NT    :NERDTree

"gcc -g -Og -Wall -Wextra -Werror -pedantic-errors -std=c11 filename.c


"Terminal Management
if has('nvim')
    tnoremap <Esc> <C-\><C-n>
endif
command STerm : split | terminal
command VTerm : vsplit | terminal
command TTerm : tabnew | terminal
