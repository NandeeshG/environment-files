
"Mar  - Added template pull commands (mar 2020)
"Feb - Added Run Build Debug commands

call plug#begin('~/.config/nvim/plugged')

    if has('nvim')
        Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    else
        Plug 'Shougo/deoplete.nvim'
        Plug 'roxma/nvim-yarp'
        Plug 'roxma/vim-hug-neovim-rpc'
    endif

    Plug 'vim-airline/vim-airline'
    Plug 'deoplete-plugins/deoplete-jedi'
    Plug 'Shougo/deoplete-clangx'

    Plug 'kyoz/purify', { 'rtp': 'vim' }   "Vibrant colours on pure black
    Plug 'jonathanfilip/vim-lucius'    "Light colours on dark, dark number gutter
    Plug 'owickstrom/vim-colors-paramount'   "LessColour on Black
    Plug 'nanotech/jellybeans.vim'  "More Colour on dark
    Plug 'morhetz/gruvbox'    "Orangish

    Plug 'christoomey/vim-system-copy'

    Plug 'vim-syntastic/syntastic'

    Plug 'mhinz/vim-startify'

    Plug 'preservim/nerdtree'

call plug#end()

let g:deoplete#enable_at_startup = 1

syntax on

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
"LuciusLightHighContrast

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
 au BufWinLeave ?* mkview 1
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
"Changed this from map to noremap on Feb8_2020
noremap <C-l> :tabn<cr>
noremap <C-h> :tabp<cr>

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

function Build_Cpp()
    "Make sure there is only one cpp file inside the folder you are running this
    "Make it more flexible later
    :wa
    ":! g++ -g -Og -Wall -Wextra -pedantic-errors *.cpp
    :! g++ -g -Og -Wall -Wextra -pedantic-errors soln.cpp
endfunction

function Run_Cpp()
    :silent exec Build_Cpp()
    :silent ! ./a.out
endfunction

function Debug_Cpp()
    :wa
    ":tabnew | terminal
    :belowright split | terminal
    ":call jobsend(b:terminal_job_id, "g++ -g -Og -Wall -Wextra -pedantic-errors *.cpp\n")
    :call jobsend(b:terminal_job_id, "g++ -g -Og -Wall -Wextra -pedantic-errors soln.cpp\n")
    :call jobsend(b:terminal_job_id, "gdb ./a.out\n")
endfunction

function Template_Cpp()
    :0  "Not deleting anything in this command to avoid accidental deletion
    :r ~/Documents/cp/nglib/TEMPLATE.cpp
endfunction

function Pull_Maths_Cpp()
    "pull at cursor
    ":0  "Not deleting anything in this command to avoid accidental deletion
    :r ~/Documents/cp/nglib/MATHS.cpp
endfunction

function Pull_Algos_Cpp()
    "pull at cursor
    ":0  "Not deleting anything in this command to avoid accidental deletion
    :r ~/Documents/cp/nglib/ALGOS.cpp
endfunction

function Pull_All_Cpp()
    :0  "Not deleting anything in this command to avoid accidental deletion
    :r ~/Documents/cp/nglib/ALL.cpp
endfunction

function Pull_SpecialQuestions_Cpp()
    "pull at cursor
    ":0  "Not deleting anything in this command to avoid accidental deletion
    :r ~/Documents/cp/nglib/SPECIAL_QUESTIONS.cpp
endfunction

"Custom commands
command Build :exec Build_Cpp()
command Run :exec Run_Cpp()
command Debug :exec Debug_Cpp()
command NT    :NERDTree
command Template :exec Template_Cpp()
command PullMathsHere :exec Pull_Maths_Cpp()
command PullAlgosHere :exec Pull_Algos_Cpp()
command PullAllBeginning :exec Pull_All_Cpp()
command PullTemplateBeginning :exec Template_Cpp()
command PullSpecialQuestionsHere :exec Pull_SpecialQuestions_Cpp()

" all mode no recursive remap of f9 and f8
noremap <F9> :Run<CR>
noremap <F8> :Debug<CR>

"gcc -g -Og -Wall -Wextra -Werror -pedantic-errors -std=c11 filename.c


"Terminal Management
if has('nvim')
    tnoremap <Esc> <C-\><C-n>       
    "tnoremap is terminal only non recursive mapping
    "similarly there are inoremap, vnoremap, nnoremap
endif
command STerm : belowright split | terminal
command VTerm : vsplit | terminal
command TTerm : tabnew | terminal
