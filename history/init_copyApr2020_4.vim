
"Apr1  - Added template pull commands and Tab movements
"Apr16 - Added NEW and NEWN commands to make new files by timestamp
"Apr 27 - changed build and debug commands to have c++17 standard and -O2,
"         added rainbow colours and multi cursor
"Apr 29 - Restructured and expanded Build,Run,Debug commands.
"         Now no need to put if #define ONLINE_JUDGE in cpp
"         Also, added .gdbinit_apr with this
"       Building
"         <F7>, build results in split terminal
"       
"       Running 
"         ctrl <F9> 2s time, file to file
"         <F8> no timeout, terminal to terminal
"         <F9> 0.2s time, file to file
"       
"       Debugging
"         ctrl <F8>, new tab debugging, file or no file can
"               be typed on own by r < input.txt or not

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

    Plug 'luochen1990/rainbow'

    Plug 'terryma/vim-multiple-cursors'

call plug#end()
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:deoplete#enable_at_startup = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
set noequalalways "This doesn't change window size automatically when opening or closing windows
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

"Added this Apr6_2020
"This makes pressing Tab in normal mode to switch windows
nnoremap <Tab> <C-w>w   

"nnoremap <S-Tab> :tabn<cr>   
"Above line works perfectly but not using RN

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


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"RAINBOW CONFIGURATIONS
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Multi cursor configs and uses

"Instructions and Readme, not code
"start: <C-n> start multicursor and add a virtual cursor + selection on the match
"next: <C-n> add a new virtual cursor + selection on the next match
"skip: <C-x> skip the next match
"prev: <C-p> remove current virtual cursor + selection and go back on previous match
"select all: <A-n> start multicursor and directly select all matches
"You can now change the virtual cursors + selection with visual mode commands. 
"For instance: c, s, I, A work without any issues. You could also go to normal mode by 
"pressing v and use normal commands there.
"
"At any time, you can press <Esc> to exit back to regular Vim.
"
"start with g<C-n> to match without boundaries (behaves like g* instead of *)

"visual mode when multiple lines are selected
"start: <C-n> add virtual cursors on each line
"You can now change the virtual cursors with normal mode commands. For instance: ciw


"If deoplete was enabled, disable for a sec
func! Multiple_cursors_before()
  if deoplete#is_enabled()
    call deoplete#disable()
    let g:deoplete_is_enable_before_multi_cursors = 1
  else
    let g:deoplete_is_enable_before_multi_cursors = 0
  endif
endfunc



"Then enable again
func! Multiple_cursors_after()
  if g:deoplete_is_enable_before_multi_cursors
    call deoplete#enable()
  endif
endfunc

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"My Own additions


" only f10 and f11 cant be used
" 
" debug -> in new terminal tab
" in tui after opening a new terminal
" 
" build -> simple one command   (popup terminal)              
" 
" run -> file to file           (timeout 2s)    (code 1)
"     -> terminal to terminal   (no timeout)    (code 2) (in split terminal)
"     -> file to file           (timeout 0.2s)  (code 3)


function Debug_Cpp()
    :wa
    :tabnew | terminal
    ":belowright split | terminal
    :call jobsend(b:terminal_job_id, "g++ -g -Og -Wall -Wextra -pedantic-errors -std=c++17 soln.cpp\n")
    :call jobsend(b:terminal_job_id, "gdb ./a.out -tui\n")
    :exe "normal a" 
    "This above line to go to last input box of terminal
endfunction

function Build_Cpp()
    :wa
    :! g++ -O2 -Wall -Wextra -pedantic-errors -std=c++17 soln.cpp
    "-g and -Og not set as we are not debugging
    " There is a problem that it goes to first line after build.
    "Following line, to go to last line doesn't work 
    ":exe "normal G"
endfunction

function Run_Cpp(code)
    :silent exec Build_Cpp()
    if a:code == 1
        ":! ./a.out
        :silent ! ./a.out < input.txt > output.txt & sleep 2s && kill $(jobs -p)
    elseif a:code == 2
        :belowright split | terminal
        :call jobsend(b:terminal_job_id, "./a.out \n")
        :exe "normal a" 
    else
        :silent ! ./a.out < input.txt > output.txt & sleep 0.2s && kill $(jobs -p)
        "Test this once
    endif

    "You can even route some other program's output to ./a.out, like
    "./a.out < ./m.out > output.txt
endfunction

""Custom commands
command Debug :exec Debug_Cpp()
command Build :exec Build_Cpp()
command Run1 :exec Run_Cpp(1)
command Run2 :exec Run_Cpp(2)
command Run3 :exec Run_Cpp(3)

" all mode no recursive remap of f9 and f8 and f7
noremap <F32> :Debug<CR>
noremap <F7>  :Build<CR>
noremap <F33> :Run1<CR>
noremap <F8>  :Run2<CR>
noremap <F9>  :Run3<CR>


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
    :r ~/Documents/cp/nglib/special/SPECIAL_ALGOS.cpp
endfunction

" not using original, just here for reference
function! SaveWithDT_original(filename) range
    let l:extension = '.' . fnamemodify( a:filename, ':e' )
    if len(l:extension) == 1
        let l:extension = '.txt'
    endif

    let l:filename = escape( fnamemodify(a:filename, ':r') . strftime("_%d_%m_%Y__%H_%M_%S") . l:extension, ' ' )

    execute "write " . l:filename
endfunction

function! SaveWithDT_Normal(...) range
    if a:0 == 0
        let l:filename1 = expand('%:t:r')
        let l:extension1 = '.' . expand('%:e')
        if len(l:extension1) == 1
            let l:extension1 = '.txt'
        endif

        let l:filenamesave1 = escape( expand('%:t:r') . strftime("_%d_%m_%Y__%H_%M_%S") . l:extension1, ' ' )

        execute "write " . l:filenamesave1
    else
        let l:filename2 = fnamemodify(a:1, ':r')
        let l:extension2 = '.' . fnamemodify( a:1, ':e' )
        if len(l:extension2) == 1
            let l:extension2 = '.txt'
        endif

        let l:filenamesave2 = escape(fnamemodify(a:1, ':r') . strftime("_%d_%m_%Y__%H_%M_%S") . l:extension2, ' ' )

        execute "write " . l:filenamesave2
    endif

    "Now that the file is saved, clear this file
    :exe "normal ggvG$d"
    " deletes from start to end of file
endfunction

function! SaveWithDT_Pull(...) range
    :call call(function("SaveWithDT_Normal"),a:000)
    " first call says to go to the function call()
    " the function call() takes two arguments, first the function name to call
    " and other the argument list
    " Pull template
    :call Template_Cpp()
endfunction

"Custom commands
"command NT    :NERDTree
command Template :exec Template_Cpp()
command PullMathsHere :exec Pull_Maths_Cpp()
command PullAlgosHere :exec Pull_Algos_Cpp()
command PullAllBeginning :exec Pull_All_Cpp()
command PullTemplateBeginning :exec Template_Cpp()
command PullSpecialQuestionsHere :exec Pull_SpecialQuestions_Cpp()

" Save my code into new file
" command! -nargs=1 NEW call SaveWithDT( <q-args> )  "The original command
" from net, kept here for reference
"
" My modifications
command! -nargs=* NEW call SaveWithDT_Pull( <f-args> )  "NEW file saved, and template pull
command! -nargs=* NEWN call SaveWithDT_Normal( <f-args> ) "NEW file saved.
" -nargs=* means 0 or more args


"Terminal Management
if has('nvim')
    tnoremap <Esc> <C-\><C-n>       
    "tnoremap is terminal only non recursive mapping
    "similarly there are inoremap, vnoremap, nnoremap
endif
command STerm : belowright split | terminal
command VTerm : vsplit | terminal
command TTerm : tabnew | terminal
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

