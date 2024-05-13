
" Need python3 in path. pynvim installed via pip. Powerline fonts installed
" and selected in terminal. nodeJs optional. Use :checkhealth in nvim. Use
" :help provider-python if python giving issues
"
" Need to install using apt -> clang-format-9


"TODO : Try language servers please

" learn omni functions and ultisnip plugin later, Also multicursor may work try again later
" Configure webd - pull template, emmet, tagalong, vim-surround, deoplete
" setup
" For webd - add a single keypress to save all, and run xdg-open index.html or reload
" website
" Configure Java and Python checkers too

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
"May 2 - Added RunJava Command
"
"May 8 - Added run pipeline, adding keymaps for this pipeline to <F6>,
"ctrl<F6> and ctrl<F7>  
"
"May 22 - Stopped multicursor, rather learn to use vim commands, and make one
"for yourself maybe. AND added automatically select first in the deoplete.
"
"May 31 - deoplete setup - changed mark names, source rankings, candidate keys
"also made commands like :Wa :Qa :Wqa do what they are supposed to
"
"June 10 - added :W and :WA commands. Added template pull for HTML,CSS,JS.
"
"Aug 10 - Big addition coming soon, I have figured out key mapping according
"to file type, and also running any file, not only soln.cpp. Need to rethink
"the setup procedure and work on it. Also maybe make this shit pretty. Also
"add something so that cursor goes back to its position after pressing <F9>
"
"Aug 18 - Working towards aug10, now pressing ctrl<F9> on either html,css or
"js files results in terminal to spawn in last tab and start live-server
"IMPPPP - In order to work around StartifySession issue, just open any
"cpp/java/javascript/python file. Then pressing <F9> will cause nvim to open
"or create input and output files and set them to the right side and also run
"the file. If input and output are already open then it shouldn't reopen them
":)
"Also move the cursor to input file after pressing <F9>
"
"Aug 19 - Run_Super more or less done with. Remaining are saving files with DT
"and c++ pipeline intergration.
"
"Aug 20 - Added a check to handle erroneaous behaviour of Run_Super_IO when an
"error was found by syntastic. Also now airline-tabline-extension is enabled
":)
"
"Aug 23 - Ctrl <F4> opens file with xdg-open, and deoplete completion
"shortcuts are commented out. Use colo purify etc to change colors.
"
"Aug 24 - Added python runners. This will be last entry like this, moving this
"file to git now
"
"Aug 25 - added python pylint support
"
"Sep 21 - Added mouse=a and notermguicolors and ternJS completion and JS
"<F8>,ctr<F8> support
"
"Sep 29 - Added Java autocompletion.

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.config/nvim/plugged')

    "Autocompletion with deoplete
    if has('nvim')
        Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    else
        Plug 'Shougo/deoplete.nvim'
        Plug 'roxma/nvim-yarp'
        Plug 'roxma/vim-hug-neovim-rpc'
    endif

    "For python
    "Plug 'deoplete-plugins/deoplete-jedi'
    "For c++ autocomplete
    Plug 'Shougo/deoplete-clangx'
    "For JavaScript
    "Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
    "For Java 
    "Plug 'artur-shaik/vim-javacomplete2'

    ""Syntax highlight file based completion
    "Plug 'shougo/neco-syntax' 
    "This neco thing didn't work


    "Themes
    Plug 'kyoz/purify', { 'rtp': 'vim' }   "Vibrant colours on pure black
    Plug 'jonathanfilip/vim-lucius'    "Light colours on dark, dark number gutter
    "Plug 'owickstrom/vim-colors-paramount'   "LessColour on Black 
    "Paramount isn;t that nice actually.
    Plug 'nanotech/jellybeans.vim'  "More Colour on dark
    Plug 'morhetz/gruvbox'    "Orangish

    "That line at the bottom
    Plug 'vim-airline/vim-airline'

    "Copy and Paste accross programs
    Plug 'christoomey/vim-system-copy'

    "Syntax checker.
    Plug 'vim-syntastic/syntastic'

    "Start screen
    Plug 'mhinz/vim-startify'

    "File browsing within vim
    Plug 'preservim/nerdtree'

    "Colour them brackets!
    Plug 'luochen1990/rainbow'   

    "Bracey is for live web preview
    "Not needed anymore, I use live-server
    "Plug 'turbio/bracey.vim'

    "Dart plugins.
    "Not using Dart
    "Plug 'dart-lang/dart-vim-plugin'

    "Plug 'terryma/vim-multiple-cursors'
    "This was creating problems with autocompletion after latest update to
    "neovim as it was automatically inserting values

call plug#end()
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:deoplete#enable_at_startup = 1

"match lower to upper too
call deoplete#custom#option('camel_case', v:true)
"when upper included, match upper to upper only
call deoplete#custom#option('smart_case', v:true)
"delay of 200 ms
call deoplete#custom#option('auto_complete_delay', 200)

set completeopt=menu,menuone,preview,noinsert
set complete=.,w,b,u,i,d,t

"REMOVED Bcos cannot find good keymaps
""One key press completion
"call deoplete#custom#option('candidate_marks',
"      \ ['!', '@', '#', '$'])
"inoremap <expr>!       pumvisible() ?
"\ deoplete#insert_candidate(0) : '!'
"inoremap <expr>@       pumvisible() ?
"\ deoplete#insert_candidate(1) : '@'
"inoremap <expr>#       pumvisible() ?
"\ deoplete#insert_candidate(2) : '#'
"inoremap <expr>$       pumvisible() ?
"\ deoplete#insert_candidate(3) : '$'

"call deoplete#custom#option('jedi', 'is_debug_enabled', 1)
"call deoplete#enable_logging('DEBUG', 'deoplete.log')
"call deoplete#custom#option('profile', v:true)
"call deoplete#custom#source('deoplete-clangx', 'is_debug_enabled', 1)

"Level to appear in pop up menu
call deoplete#custom#source('omni','rank',700)
call deoplete#custom#source('around','rank',500)
call deoplete#custom#source('file','rank', 350)
call deoplete#custom#source('buffer','rank',200)
call deoplete#custom#source('member','rank',200)
call deoplete#custom#source('clangx', 'rank', 100)

"Length of word to be typed before searching.
call deoplete#custom#source('omni','min_pattern_length',2)
call deoplete#custom#source('around','min_pattern_length',2)
call deoplete#custom#source('file','min_pattern_length', 2)
call deoplete#custom#source('buffer','min_pattern_length',2)
call deoplete#custom#source('member', 'min_pattern_length', 2)
call deoplete#custom#source('clangx', 'min_pattern_length', 2)

"Change what displays for their names.
call deoplete#custom#source('omni', 'mark', '[om]')
call deoplete#custom#source('around', 'mark', '[ar]')
call deoplete#custom#source('file','mark', '[fl]')
call deoplete#custom#source('buffer','mark', '[bf]')
call deoplete#custom#source('member', 'mark', '[mb]')
call deoplete#custom#source('clangx', 'mark', '[cx]')

"Range of around and symbols.
call deoplete#custom#var('around', {
\   'range_above': 50,
\   'range_below': 50,
\   'mark_above': '[↑]',
\   'mark_below': '[↓]',
\   'mark_changes': '[*]',
\})


"check :help deoplete-faq
"check :help deoplete-sources

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Java Completion

""before this, run sudo apt install maven
"autocmd FileType java setlocal omnifunc=javacomplete#Complete
"let g:JavaComplete_EnableDefaultMappings = 0


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Tern JS
"Always copy .tern-project file to :pwd of file

""Set bin if you have many instalations
"let g:deoplete#sources#ternjs#tern_bin = '/usr/local/bin/tern'
"let g:deoplete#sources#ternjs#timeout = 1

" Whether to include the types of the completions in the result data. Default: 0
let g:deoplete#sources#ternjs#types = 1

" Whether to include the distance (in scopes for variables, in prototypes for 
" properties) between the completions and the origin position in the result 
" data. Default: 0
let g:deoplete#sources#ternjs#depths = 1

" Whether to include documentation strings (if found) in the result data.
" Default: 0
let g:deoplete#sources#ternjs#docs = 1

" When on, only completions that match the current word at the given point will
" be returned. Turn this off to get all results, so that you can filter on the 
" client side. Default: 1
let g:deoplete#sources#ternjs#filter = 0

" Whether to use a case-insensitive compare between the current word and 
" potential completions. Default 0
let g:deoplete#sources#ternjs#case_insensitive = 1

" When completing a property and no completions are found, Tern will use some 
" heuristics to try and return some properties anyway. Set this to 0 to 
" turn that off. Default: 1
let g:deoplete#sources#ternjs#guess = 0

" Determines whether the result set will be sorted. Default: 1
let g:deoplete#sources#ternjs#sort = 1

" When disabled, only the text before the given position is considered part of 
" the word. When enabled (the default), the whole variable name that the cursor
" is on will be included. Default: 1
let g:deoplete#sources#ternjs#expand_word_forward = 0

" Whether to ignore the properties of Object.prototype unless they have been 
" spelled out by at least two characters. Default: 1
let g:deoplete#sources#ternjs#omit_object_prototype = 1

" Whether to include JavaScript keywords when completing something that is not 
" a property. Default: 0
let g:deoplete#sources#ternjs#include_keywords = 0

" If completions should be returned when inside a literal. Default: 1
let g:deoplete#sources#ternjs#in_literal = 0


"Add extra filetypes
let g:deoplete#sources#ternjs#filetypes = [
                \ 'jsx',
                \ 'javascript.jsx',
                \ 'vue',
                \ '...'
                \ ]

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""Neco-Syntax
"
"let g:necosyntax#min_keyword_length = 2



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
set mouse=a

"Close preview window on going to insert mode, or even completing the autocomplete
"autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | silent! pclose | endif
"This closes only when you press escape(i.e. when you leave insert mode)
autocmd InsertLeave * if pumvisible() == 0 | silent! pclose | endif

"Some Graphics
set notermguicolors  "So that terminal takes color from outside of vim
set background=dark  "Many colorschemes automatically change, namely gruvbox, lucius, paramount
"their modes acc to this. dark or light

let g:purify_bold = 1        
let g:purify_italic = 1      
let g:purify_underline = 1
let g:purify_undercurl = 1   
let g:purify_inverse = 1     
colorscheme purify
hi CursorLine guifg=NONE ctermfg=NONE guibg=#1a1a1a ctermbg=237 gui=NONE cterm=NONE

"This function helps in checking value of a highlight group
function! ReturnHighlightTerm(group, term)
   " Store output of group to variable
   let output = execute('hi ' . a:group)

   " Find the term we're looking for
   return matchstr(output, a:term.'=\zs\S*')
endfunction
"let b = ReturnHighlightTerm('StatusLine', 'ctermbg')


let g:jellybeans_use_term_italics = 1
"colorscheme jellybeans

"gruvbox specific
" let g:gruvbox_ = ''   "TEMPLATE
let g:gruvbox_bold = '1'
let g:gruvbox_italic = '1'
let g:gruvbox_underline = '1'
let g:gruvbox_undercurl = '1'
let g:gruvbox_contrast_dark = 'hard'  
"choose contrast from 'soft', 'medium', 'hard'
let g:gruvbox_contrast_light = 'medium'  
let g:gruvbox_italicize_strings = '1'
"let g:gruvbox_number_column = 
"let g:gruvbox_sign_column = 
"let g:gruvbox_color_column = 
"let g:gruvbox_vert_split = 
"colorscheme gruvbox


"colorscheme lucius
"LuciusBlackHighContrast
" Lucius<Dark/Black/Light/White><null/HighContrast/LowContrast>
" This is lucius use template. Just put whatever you
" want after setting colorscheme lucius
" like as given below, just write that and it will work
"LuciusLightHighContrast


"set showtabline=2  "TABS on top, like chrome
"set laststatus=2   "Statusline at bottom, default in nvim


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
"let g:syntastic_debug = 1
let g:syntastic_cpp_config_file = "syntastic_cpp_gcc_config_file"

" GCC Flags
" https://gcc.gnu.org/onlinedocs/gcc/Warning-Options.html
"-Wextra, -Wall: essential.
"-Wfloat-equal: useful because usually testing floating-point numbers for equality is bad.
"-Wundef: warn if an uninitialized identifier is evaluated in an #if directive.
"-Wshadow: warn whenever a local variable shadows another local variable, parameter or global variable or whenever a built-in function is shadowed.
"-Wpointer-arith: warn if anything depends upon the size of a function or of void.
"-Wcast-align: warn whenever a pointer is cast such that the required alignment of the target is increased. For example, warn if a char * is cast to an int * on machines where integers can only be accessed at two- or four-byte boundaries.
"-Wstrict-prototypes: warn if a function is declared or defined without specifying the argument types.
"-Wstrict-overflow=5: warns about cases where the compiler optimizes based on the assumption that signed overflow does not occur. (The value 5 may be too strict, see the manual page.)
"-Wwrite-strings: give string constants the type const char[length] so that copying the address of one into a non-const char * pointer will get a warning.
"-Waggregate-return: warn if any functions that return structures or unions are defined or called.
"-Wcast-qual: warn whenever a pointer is cast to remove a type qualifier from the target type*.
"-Wswitch-default: warn whenever a switch statement does not have a default case*.
"-Wswitch-enum: warn whenever a switch statement has an index of enumerated type and lacks a case for one or more of the named codes of that enumeration*.
"-Wconversion: warn for implicit conversions that may alter a value*.
"-Wunreachable-code: warn if the compiler detects that code will never be executed*.




""Install NodeJS, npm and then ESlint globally. Then do
"    "eslint --init to start

"Because eslint wasn't working with react
"This fix doesn't work
"let g:syntastic_javascript_eslint_exec = '/usr/local/bin/eslint'

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_typescript_checkers = ['eslint']


"STEPS TO INSTALL - sudo apt install pylint3 pylint 
"Then go to ~/ directory and run pylint --generate-rcfile > ~/.pylintrc
"in that rcfile you can set your desired options
let g:syntastic_python_pylint_exe = 'python3 -m pylint'
let g:syntastic_python_checkers = ['pylint']

"To debug :mes
"let g:syntastic_debug = 1

"the following function will make the error window smaller if fewer than 10 errors are found: >
function! SyntasticCheckHook(errors)
    if !empty(a:errors)
        let g:syntastic_loc_list_height = min([len(a:errors)+1, 10])
        let g:bool_errors_found = 1
    else
        let g:bool_errors_found = 0
    endif
endfunction


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"These lines of code help by remembering the fold or unfolded state of code
augroup remember_folds
 autocmd!
 au BufWinLeave ?* mkview 1
 au BufWinEnter ?* silent! loadview 1
augroup END

""""TABS AND SPACES  see :help tabstop
"Always keep 'tabstop' at 8, set 'softtabstop' and 'shiftwidth' to 4
"(or 3 or whatever you prefer) and use 'noexpandtab'.  Then Vim
"will use a mix of tabs and spaces, but typing <Tab> and <BS> will
"behave like a tab appears every 4 (or 3) characters.
set tabstop=8   "number of visual spaces per tab
set softtabstop=2   "no of spaces in tab when editing
set shiftwidth=2
set expandtab

""""GRAPHICAL
set number 
"Toggle relativenumber only in the window in which you are focussed!
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END

set showcmd
set noequalalways "This doesn't change window size automatically when opening or closing windows
set cursorline
"""" Default Colors for CursorLine
"highlight  CursorLine ctermbg=234 ctermfg=None
"" Change Color when entering Insert Mode
"autocmd InsertEnter * highlight  CursorLine ctermbg=238 ctermfg=None
"" Revert Color to default when leaving Insert Mode
"autocmd InsertLeave * highlight  CursorLine ctermbg=234 ctermfg=None
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
"noremap j gj
"noremap k gk

"Tried to achieve the following line's effect, but instead had to turn off
"curly bracket highlighting
"syn clear cErrInBracket
let c_no_curly_error = 1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RUN THIS FIRST sudo apt-get install fonts-powerline
" air-line
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_splits = 1

"disable displaying buffers with a single tab
let g:airline#extensions#tabline#show_buffers = 0  

let g:airline#extensions#tabline#show_tab_count = 1
let g:airline#extensions#tabline#fnamemod = ':t:r'
let g:airline#extensions#tabline#overflow_marker = '…'
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#show_tab_nr = 0

"Check :help airline-tabline
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>+ <Plug>AirlineSelectNextTab

let g:airline#extensions#term#enabled = 1

"echo expand('%:t:r') gives filename

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


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Startify stuff
let g:startify_bookmarks = ['~/.vimrc','~/.profile','~/.bashrc','~/.gdbinit','~/.gitconfig','~/.pylintrc','~/.config/nvim/init.vim']  "A list of files or directories to bookmark.
let g:startify_change_to_dir = 1
let g:startify_update_oldfiles = 0  "Update startify on-the-fly, not only on exit
let g:startify_custom_header = 'startify#center(startify#fortune#cowsay())'
autocmd VimEnter *
            \   if !argc()
            \ |   Startify
            \ |   NERDTree
            \ |   wincmd w
            \ | endif

let g:startify_lists = [
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ { 'type': 'files',     'header': ['   MRU']            },
      \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
      \ { 'type': 'commands',  'header': ['   Commands']       },
      \ ]




""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"RAINBOW CONFIGURATIONS
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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


""If deoplete was enabled, disable for a sec
"func! Multiple_cursors_before()
"  if deoplete#is_enabled()
"    call deoplete#disable()
"    let g:deoplete_is_enable_before_multi_cursors = 1
"  else
"    let g:deoplete_is_enable_before_multi_cursors = 0
"  endif
"endfunc
"
"
"
""Then enable again
"func! Multiple_cursors_after()
"  if g:deoplete_is_enable_before_multi_cursors
"    call deoplete#enable()
"  endif
"endfunc


"RATHER TRY THIS LATER ON
"function g:Multiple_cursors_before()
"	  call deoplete#custom#buffer_option('auto_complete', v:false)
"	endfunction
"	function g:Multiple_cursors_after()
"	  call deoplete#custom#buffer_option('auto_complete', v:true)
"	endfunction



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"PIPELINE STUFF TO BE MOVED TO SUPER LATER.


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
"
" pipeline -> generator to result  (timeout 1s for each file) (code 1)
"          -> input.txt to result  (timeout 1s for each file) (code 2)

"function Debug_soln()
"    :wa
"    :tabnew | terminal
"    ":belowright split | terminal
"    :call jobsend(b:terminal_job_id, "g++ -g -Og -Wall -Wextra -pedantic-errors -std=c++17 soln.cpp\n")
"    :call jobsend(b:terminal_job_id, "gdb ./a.out -tui\n")
"    :exe "normal a" 
"    "This above line to go to last input box of terminal
"endfunction
"
"function Build_soln()
"    :wa
"    :! g++ -O2 -Wall -Wextra -pedantic-errors -std=c++17 soln.cpp
"    "-g and -Og not set as we are not debugging
"    " There is a problem that it goes to first line after build.
"    "Following line, to go to last line doesn't work 
"    ":exe "normal G"
"endfunction
"
"function Run_soln(code)
"    ""if a:code == 1 && (expand('%:e')==#"js" || expand('%:e')==#"html" || expand('%:e')==#"css")
"    ""    :call Run_LiveServer()
"    ""    return
"    ""endif
"    ""if a:code == 3 && expand('%:e')==#"js"
"    ""    :call Run_JS()
"    ""    return
"    ""endif
"
"    :silent exec Build_soln()
"    if a:code == 1
"        ":! ./a.out
"        :silent ! ./a.out < input.txt > output.txt & sleep 2s && kill $(jobs -p)
"    elseif a:code == 2
"        :belowright split | terminal
"        :call jobsend(b:terminal_job_id, "./a.out \n")
"        :exe "normal a" 
"    elseif a:code == 3
"        :silent ! ./a.out < input.txt > output.txt & sleep 0.2s && kill $(jobs -p)
"        "Test this once
"    else
"        :silent ! ./a.out < ginput.txt > output.txt & sleep 1s && kill $(jobs -p)
"    endif
"
"    "You can even route some other program's output to ./a.out, like
"    "./a.out < ./m.out > output.txt
"endfunction
"
""working fine
"function Run_generator()
"    :wa
"    :! g++ -O2 -Wall -Wextra -pedantic-errors -std=c++17 generator.cpp -o generator.out
"    :silent ! ./generator.out > ginput.txt & sleep 1s && kill $(jobs -p)
"endfunction
"
""working fine
"function Run_csoln(code)
"    :wa
"    if a:code == 1
"        :! g++ -O2 -Wall -Wextra -pedantic-errors -std=c++17 csoln.cpp -o csoln.out
"        :silent ! ./csoln.out < ginput.txt > coutput.txt & sleep 1s && kill $(jobs -p)
"    else
"        :! g++ -O2 -Wall -Wextra -pedantic-errors -std=c++17 csoln.cpp -o csoln.out
"        :silent ! ./csoln.out < input.txt > coutput.txt & sleep 1s && kill $(jobs -p)
"    endif
"endfunction
"
""working fine
"function Run_checker(code)
"    :wa
"    if a:code == 1
"        :! g++ -O2 -Wall -Wextra -pedantic-errors -std=c++17 checker.cpp -o checker.out
"        :silent ! ./checker.out ginput.txt > result.txt & sleep 1s && kill $(jobs -p)
"    else
"        :! g++ -O2 -Wall -Wextra -pedantic-errors -std=c++17 checker.cpp -o checker.out
"        :silent ! ./checker.out input.txt > result.txt & sleep 1s && kill $(jobs -p)
"    endif
"endfunction
"
""working fine
"function Run_pipeline(code)
"    :wa
"    if a:code == 1
"        :exec Run_generator()
"        ""Run generator
"        ":! g++ -O2 -Wall -Wextra -pedantic-errors -std=c++17 generator.cpp -o generator.out
"        ":silent ! ./generator.out > ginput.txt & sleep 1s && kill $(jobs -p)
"
"        :exec Run_soln(4)
"        "Run my soln
"        ":! g++ -O2 -Wall -Wextra -pedantic-errors -std=c++17 soln.cpp
"        ":silent ! ./a.out < ginput.txt > output.txt & sleep 1s && kill $(jobs -p)
"
"        :exec Run_csoln(1)
"        ""Run brute force
"        ":! g++ -O2 -Wall -Wextra -pedantic-errors -std=c++17 csoln.cpp -o csoln.out
"        ":silent ! ./csoln.out < ginput.txt > coutput.txt & sleep 1s && kill $(jobs -p)
"
"        :exec Run_checker(1)
"        ""Run checker
"        ":! g++ -O2 -Wall -Wextra -pedantic-errors -std=c++17 checker.cpp -o checker.out
"        ":silent ! ./checker.out ginput.txt > result.txt & sleep 1s && kill $(jobs -p)
"    else
"        :exec Run_soln(1)
"        "Run my soln
"        ":! g++ -O2 -Wall -Wextra -pedantic-errors -std=c++17 soln.cpp
"        ":silent ! ./a.out < ginput.txt > output.txt & sleep 1s && kill $(jobs -p)
"
"        :exec Run_csoln(2)
"        ""Run brute force
"        ":! g++ -O2 -Wall -Wextra -pedantic-errors -std=c++17 csoln.cpp -o csoln.out
"        ":silent ! ./csoln.out < input.txt > coutput.txt & sleep 1s && kill $(jobs -p)
"
"        :exec Run_checker(2)
"        ""Run checker
"        ":! g++ -O2 -Wall -Wextra -pedantic-errors -std=c++17 checker.cpp -o checker.out
"        ":silent ! ./checker.out input.txt > result.txt & sleep 1s && kill $(jobs -p)
"    endif
"endfunction
"
"""Custom commands
"command Debug  :exec Debug_soln()
"command Build  :exec Build_soln()
"command Run1   :exec Run_soln(1)
"command Run2   :exec Run_soln(2)
"command Run3   :exec Run_soln(3)
"command Run4   :exec Run_soln(4)
"command Runp1  :exec Run_pipeline(1)
"command Runp2  :exec Run_pipeline(2)

" all mode no recursive remap of f9 and f8 and f7
" <F31> this is ctrl <F7>,  it is not being used right now
" map <F6> and <F30> to cp_pipelines.
" cp_pipeline -> run gen and put its output in ginput
" then run soln.cpp on ginput.txt and put to output.txt
" and run csoln.cpp on ginput.txt and put to coutput.txt
" then run checker on output.txt and coutput.txt and print to result.txt
" <F6> will run generator and whole pipeline
" <F30> will not run gen, instead it will use input.txt instead of ginput.txt

"noremap <F32> :Debug<CR>
"noremap <F7>  :Build<CR>
""f33 is ctrl <F9>
"noremap <F33> :Run1<CR>
"noremap <F8>  :Run2<CR>
"noremap <F9>  :Run3<CR>
"noremap <F31> :Run4<CR>
"noremap <F6>  :Runp1<CR>
"noremap <F30> :Runp2<CR>


"F9 -> Run soln.cpp from input to output, time limit 0.2sec
"
"Ctrl F9 -> Run soln.cpp from input to output, time limit 2sec
"
"F8 -> Run soln.cpp in new terminal window (user gives input, infinite time, manual break possible)
"
"Ctrl F8 -> Run visual debugger in new tab
"
"F7 -> Only compile and display the result
"
"Ctrl F7 -> Run soln.cpp on ginput.txt and print to output.txt (time limit 1s) (input generator is not run)
"THIS KEY CAN BE REMAPPED, NOT USED MUCH, JUST FOR SPACE FILLING
"
"F6 -> Run input generator to make input file. Run soln.cpp and brute.cpp on this generated input. Then run checker to compare the two outputs and display the difference in result.txt
"
"Ctrl F6 -> Run soln.cpp and brute.cpp on input.txt, and then checker finds the difference and puts in result.txt   (basically, do not run input generator. )

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function Template_Sql()
    :0  "Not deleting anything in this command to avoid accidental deletion
    :r ~/Documents/cp/nglib/TEMPLATE.sql
    :exe "normal ggddG"
endfunction

function Template_Bare()
    :0  "Not deleting anything in this command to avoid accidental deletion
    :r ~/Documents/cp/nglib/TEMPLATE_BARE.cpp
    :exe "normal ggddG"
endfunction

function Template_Cpp()
    :0  "Not deleting anything in this command to avoid accidental deletion
    :r ~/Documents/cp/nglib/TEMPLATE.cpp
    :exe "normal ggddG"
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
    :exe "normal ggddG"
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

"These are handy for quicker closing.
command W   :w
command Wq  :wq
command WQ  :wq
command Wa  :wa
command WA  :wa
command Wqa :wqa 
command WQa :wqa
command WQA :wqa
command Qa  :qa 
command QA  :qa 
command Q   :q

" Save my code into new file
" command! -nargs=1 NEW call SaveWithDT( <q-args> )  "The original command
" from net, kept here for reference
"
" My modifications
command! -nargs=* NEW call SaveWithDT_Pull( <f-args> )  "NEW file saved, and template pull
command! -nargs=* NEWN call SaveWithDT_Normal( <f-args> ) "NEW file saved.
" -nargs=* means 0 or more args

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Terminal Management
if has('nvim')
    tnoremap <Esc> <C-\><C-n>       
    "tnoremap is terminal only non recursive mapping
    "similarly there are inoremap, vnoremap, nnoremap
endif
command STerm : belowright split | terminal
command VTerm : vsplit | terminal
command TTerm : tabnew | terminal

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"TEMPLATES

function Template_Html()
    :0  "Not deleting anything in this command to avoid accidental deletion
    :r ~/Documents/wd/nglib/HTML_TEMPLATE.html
    :exe "normal ggddG"
endfunction

function Template_Javascript()
    :0  "Not deleting anything in this command to avoid accidental deletion
    :r ~/Documents/wd/nglib/JS_TEMPLATE.js
    :exe "normal ggddG"
endfunction

function Template_Css()
    :0  "Not deleting anything in this command to avoid accidental deletion
    :r ~/Documents/wd/nglib/CSS_TEMPLATE.css
    :exe "normal ggddG"
endfunction

function Template_Java()
    :0
    :r ~/Documents/cp/nglib/JAVA_TEMPLATE.java 
    :exe "normal ggddG"
endfunction

function Template_Python()
    :0
    :r ~/Documents/cp/nglib/PYTHON_TEMPLATE.py
    :exe "normal ggddG"
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" SuperVIM

function Run_Super_OpenIO()
    :wa

    "DO NOT EVER CALL THIS FUNCTION BEFORE CHECKING THAT 
    "SYNTASTIC ERROR WINDOW IS OPEN OR NOT
    "I AM DOING THAT IN Run_Super() 

    "let l:ipexists = bufexists(bufname("input.txt"))
    "let l:opexists = bufexists(bufname('output.txt'))
    let l:ipnr2=bufwinnr("input.txt") 
    let l:opnr2=bufwinnr("output.txt")
    if l:ipnr2==-1 || l:opnr2==-1 
        "Make sure only source code is open now
        :wincmd t
        :silent only
    else 
        "Go back to input box
        :wincmd b
        :wincmd k
        "Nothing to do for this function
        return
    endif

    let l:ipnr2=bufwinnr("input.txt") 
    let l:opnr2=bufwinnr("output.txt")

    if (l:ipnr2==-1 && l:opnr2==-1)
        "open both and set them on screen
        :vs output.txt
        :sp input.txt
        :wincmd b
        :wincmd H

        "go to output and put cursor on top
        :wincmd b
        :0
    endif

    "Go to first window, get its width and resize
    :wincmd t
    let l:width = float2nr(round(winwidth(0)*(0.3)))
    :call feedkeys("\<c-w>".l:width."<",'n')

    "Go back to input box
    :wincmd b
    :wincmd k
    "let l:newipid = bufwinid("input.txt")
    ":call win_gotoid(l:newipid)
    " :0  "UNCOMMENT THIS IF YOU WANT TO GO TO TOP ALWAYS
endfunction

function! s:getchar()
    let c = getchar()
    if c =~ '^\d\+$'
        let c = nr2char(c)
    endif
    return c
endfunction

function Run_Super(code)
    "code 40 - <F4>
    "code 45 - ctrl<F4>
    "code 50 - <F5>
    "code 55 - ctrl<F5>
    "code 60 - <F6>
    "code 65 - ctrl<F6>
    "code 70 - <F7>
    "code 75 - ctrl<F7>
    "code 80 - <F8>
    "code 85 - ctrl<F8>
    "code 90 - <F9>
    "code 95 - ctrl<F9>

    if expand('%:e')==#"txt" && a:code!=45
        :wincmd t
    endif 
    :wa

    "Syntastic error window open
    "This variable is made by me, check SyntasticCheckHook() function in above
    "code somewhere
    "If special case <F4> pressed then don't exit
    if g:bool_errors_found==1 && a:code!=40  && a:code!=70
        return
    endif

    let l:ext = expand('%:e')
    let l:filename = expand('%')
    let l:onlyname = expand('%:t:r')

    "------------------------------------------------
    if l:ext==#"txt"
        if a:code == 45
            "Open in text editor
            :execute "! xdg-open" l:filename
            :call feedkeys("<CR>")
        endif

    elseif l:ext==#"js"
        if a:code == 40
            :0
            :execute "normal dGdd"
            :call Template_Javascript()
        elseif a:code == 45
            :execute "! xdg-open" l:filename
            :call feedkeys("<CR>")

        elseif a:code == 80
            "Run only output quick execution
            :wincmd t
            :execute "! node" l:filename

        elseif a:code == 85
            "SplitTerminal on same screen
            :wincmd t
            :belowright split | terminal
            :call jobsend(b:terminal_job_id, "node ".l:filename."\n")
            :call feedkeys("a")
        
        elseif a:code == 90
            "Run input.txt output.txt
            :call Run_Super_OpenIO()
            :execute "! node" l:filename "< input.txt > output.txt"
        elseif a:code == 95
            "Run live server
            :wincmd t
            :$tabnew | terminal
            :call jobsend(b:terminal_job_id, "live-server\n")
        endif
        "------------------------------------------------

    elseif l:ext==#"html"
        if a:code == 40
            :0
            :execute "normal dGdd"
            :call Template_Html()
        elseif a:code == 45
            :execute "! xdg-open" l:filename
            :call feedkeys("<CR>")
        elseif a:code == 90
            :execute "! google-chrome" l:filename
            :call feedkeys("<CR>")
        elseif a:code == 95
            :$tabnew | terminal
            :call jobsend(b:terminal_job_id, "live-server\n")
        endif
        "------------------------------------------------

    elseif l:ext==#"css"
        if a:code == 40
            :0
            :execute "normal dGdd"
            :call Template_Css()
        elseif a:code == 45
            :execute "! xdg-open" l:filename
            :call feedkeys("<CR>")
        elseif a:code == 95
            :$tabnew | terminal
            :call jobsend(b:terminal_job_id, "live-server\n")
        endif
        "------------------------------------------------
        
    elseif l:ext==#"sql"
        if a:code == 40
            :0
            :execute "normal dGdd"
            :call Template_Sql()

        elseif a:code == 45
            "Open with text editor
            :execute "! xdg-open" l:filename
            :call feedkeys("<CR>")

        elseif a:code == 80
            "Run only output quick execution
            :wincmd t
            :execute "! psql -f" l:filename

        elseif a:code == 85
            "Run with Split terminal
            "SplitTerminal on same screen
            :wincmd t
            :belowright split | terminal
            :call jobsend(b:terminal_job_id, "psql -f ".l:filename."\n")
            :call feedkeys("a")

        elseif a:code == 90
            "IP OP Run
            :call Run_Super_OpenIO()
            :execute "silent ! psql -f ".l:filename." > output.txt"

        endif

        "------------------------------------------------

    elseif l:ext==#"go"
        if a:code == 45
            "Open with text editor
            :execute "! xdg-open" l:filename
            :call feedkeys("<CR>")
        elseif a:code == 70
            "Only compile 
        elseif a:code == 75
            "Debugger in newTab
        elseif a:code == 80
            "Run only output quick execution
            :wincmd t
            :execute "! go run " l:filename
        elseif a:code == 85
            "Run with Split terminal
            "SplitTerminal on same screen
            :wincmd t
            :belowright split | terminal
            :call jobsend(b:terminal_job_id, "go run ".l:filename."\n")
            :call feedkeys("a")

        elseif a:code == 90
            :call Run_Super_OpenIO()
            :execute "silent ! go run ".l:filename." < input.txt > output.txt"
        endif

    elseif l:ext==#"cpp"
        if a:code == 40
            "Pull template
            "DO THIS LATER, Ask user to save or not, use SavewithDT functions
            ":echo "Save current file before loading template? (y/n)"
            "let l:char = s:getchar()
            "if l:char=='n'
            "    " Do not save it
            "else
            "    " Save it
            "endif

            "Right now I am just deleting the text and pulling template, 
            "so be careful in using this :)
            :0
            :execute "normal dGdd"
            :call Template_Cpp()

        elseif a:code == 45
            "Open with text editor
            :execute "! xdg-open" l:filename
            :call feedkeys("<CR>")

        elseif a:code == 50
            :0
            :execute "normal dGdd"
            :call Template_Bare()

        elseif a:code == 70
            "Only compile 
            :execute "! g++ -O2 -Wall -Wextra -pedantic-errors -std=c++17" l:filename

        elseif a:code == 75
            "Debugger in newTab
            :tabnew | terminal
            :call jobsend(b:terminal_job_id, "g++ -g -Og -Wall -Wextra -pedantic-errors -std=c++17 ".l:filename."\n")
            :call chansend(b:terminal_job_id, "gdb ./a.out -tui")
            :call feedkeys("a")
            "This above line to go to last input box of terminal

        elseif a:code == 80
            "Run only output quick execution
            :wincmd t
            :execute "silent ! g++ -O2 -Wall -Wextra -pedantic-errors -std=c++17" l:filename
            :execute "! ./a.out "

        elseif a:code == 85
            "Run with Split terminal
            "Build cpp file
            :execute "silent ! g++ -O2 -Wall -Wextra -pedantic-errors -std=c++17" l:filename
            "SplitTerminal on same screen
            :wincmd t
            :belowright split | terminal
            :call jobsend(b:terminal_job_id, "./a.out \n")
            :call feedkeys("a")

        elseif a:code == 90
            "IP OP Run 0.2sec
            "Build cpp file
            :execute "silent ! g++ -O2 -Wall -Wextra -pedantic-errors -std=c++17" l:filename
            :call Run_Super_OpenIO()

            "0.2sec run noDBG
            "OLD run command
            ":silent ! ./a.out < input.txt > output.txt 2>&1 & sleep 0.2s && kill $(jobs -p)

            " Trying timing (BETTER IS TO HAVE TIMING IN PROGRAM ITSELF)
            ":silent ! /usr/bin/time -a -f 
            ""\n\n----------\n\%Uuser \%Ssystem \%Eelapsed \n\%PCPU (\%Xtext+\%Ddata \%Mmax)k \n\%Iinputs+\%Ooutputs \n(\%Fmajor+\%Rminor)pagefaults \%Wswaps \n----------\n" -o output.txt ./a.out < input.txt > output.txt 2>&1 & sleep 0.2s && kill $(jobs -p)
            "
            
            " 1.simple input output with file.
            " 2.stderr into output.txt (outputs using cerr<<)
            " 3.shell errors into output.txt (like core dumped msgs)
            " 4.kill after some seconds
            "
            " BELOW COMMAND WORKS ONLY FOR INTERACTIVE TERMINAL - MORE TESTING NEEDED
            ":! { ./a.out < input.txt > output.txt 2>&1 & export pid=$! ; } 2>> output.txt && sleep 0.2s  && echo 'pid=$pid' && kill $pid       
            "
            " BELOW TWO COMMANDS WORKS FOR NON INTERACTIVE TERMINAL - MORE TESTING NEEDED

            " command 1. THIS DOESN'T APPEND FLOATING POINT ERROR CORE DUMPED MSGS TO
            " OUTPUT.TXT BECAUSE ECHO and 2>>output.txt don't work well
            " together
            " : ! { ./a.out < input.txt > output.txt 2>&1 & echo "Started pid $(jobs -p)" ; } & sleep 0.5s && { [[ -z "$(jobs -p)" ]] || { echo "Killing $(jobs -p)" && kill "$(jobs -p)" && echo "Killed." ; } ; } && echo "Stopped."

            " command 2. THIS ONE WORKS SILENTLY, AND PRINT KILLED PROC ON OUTPUT WHEN
            " TLE OCCURS (ALSO PRINTS EXCEPTION HANDLING and SHELL ERRORS BOTH
            " TO OUTPUT WHEN THEY OCCUR)
            " BELOW ONE DOESN'T KILL PROCESS EVERY TIME
            " : silent ! { ./a.out < input.txt > output.txt 2>&1 ; } 2>> output.txt & sleep 0.3s && { [[ -z "$(jobs -p)" ]] || { kill "$(jobs -p)" && echo "KILLED PROC" >> output.txt ; } ; }

            " THIS IS THE FINAL ONE IG
            " ACTUALLY JUST NEEDED TO PREPEND a \ in the command at line 1209
            " Supressing kill's output
            : silent ! { ./a.out < input.txt > output.txt 2>&1 & export pid=$\!
                        \ && sleep 0.3s
                        \ && printf "\n\n" >> output.txt
                        \ && kill $pid 2> /dev/null 
                        \ && printf "<<<KILLED $pid>>>\n" >> output.txt
                        \ || printf "<<<EXITED $pid>>>\n" >> output.txt
                        \ ; } 2>> output.txt

        elseif a:code == 95
            "IP OP Run 2sec
            "Build cpp file
            :execute "silent ! g++ -O2 -Wall -Wextra -pedantic-errors -std=c++17" l:filename
            :call Run_Super_OpenIO()
            "2sec run with DBG
            ":silent ! ./a.out 1 < input.txt > output.txt 2>&1 & sleep 2s && kill $(jobs -p)
             ":silent ! /usr/bin/time -av -o output.txt ./a.out 1 < input.txt > output.txt 2>&1 & sleep 2s && kill $(jobs -p)
             "------------------------------------------------
             " See a:code==90 if block to see how this command came

            : silent ! { ./a.out 1 < input.txt > output.txt 2>&1 & export pid=$\!
                        \ && sleep 1.5s
                        \ && printf "\n\n" >> output.txt
                        \ && kill $pid 2> /dev/null 
                        \ && printf "<<<KILLED $pid>>>\n" >> output.txt
                        \ || printf "<<<EXITED $pid>>>\n" >> output.txt
                        \ ; } 2>> output.txt

        endif

    elseif l:ext==#"c"
        "Match this with cpp later !!
        if a:code == 45
            "Open in text editor
            :execute "! xdg-open" l:filename
            :call feedkeys("<CR>")
        elseif a:code == 80
            "Build c file
            :execute "silent ! gcc " l:filename
            "SplitTerminal on same screen
            :wincmd t
            :belowright split | terminal
            :call jobsend(b:terminal_job_id, "./a.out \n")
            :call feedkeys("a")

        elseif a:code == 85
            "Debugger in newTab
            :tabnew | terminal
            :call jobsend(b:terminal_job_id, "gcc -g ".l:filename."\n")
            :call chansend(b:terminal_job_id, "gdb ./a.out -tui")
            :call feedkeys("a")
            "This above line to go to last input box of terminal

        elseif a:code == 90
            "Build cpp file
            :execute "silent ! gcc " l:filename
            :call Run_Super_OpenIO()
            "0.2sec run noDBG
            :silent ! ./a.out < input.txt > output.txt & sleep 0.2s && kill $(jobs -p)

        elseif a:code == 95
            "Build cpp file
            :execute "silent ! gcc " l:filename
            :call Run_Super_OpenIO()
            "2sec run noDBG
            :silent ! ./a.out < input.txt > output.txt & sleep 2s && kill $(jobs -p)
        endif

        "------------------------------------------------

    elseif l:ext==#"py"
        if a:code == 40
            "Pull template
            "DO THIS LATER, Ask user to save or not, use SavewithDT functions
            ":echo "Save current file before loading template? (y/n)"
            "let l:char = s:getchar()
            "if l:char=='n'
            "    " Do not save it
            "else
            "    " Save it
            "endif

            "Right now I am just deleting the text and pulling template, 
            "so be careful in using this :)
            :0
            :execute "normal dGdd"
            :call Template_Python()
        elseif a:code == 45
            "Open in text editor
            :execute "! xdg-open" l:filename
            :call feedkeys("<CR>")
        elseif a:code == 80
            "Quick execution, no input
            :wincmd t
            :execute "! python3 " l:filename
        elseif a:code == 85
            "SplitTerminal on same screen
            :wincmd t
            :belowright split | terminal
            :call jobsend(b:terminal_job_id, "python3 ".l:filename."\n")
            :call feedkeys("a")
        elseif a:code == 90 
            "Open IO
            :call Run_Super_OpenIO()
            :execute "silent ! python3" l:filename "< input.txt > output.txt"
        endif

        "------------------------------------------------

    elseif l:ext==#"java"
        if a:code == 40
            "Pull template
            :0
            :execute "normal dGdd"
            :call Template_Java()
        elseif a:code == 45
            "Open in text editor
            :execute "! xdg-open" l:filename
            :call feedkeys("<CR>")
        elseif a:code == 70
            "Only compile
            :execute "! javac" l:filename
        elseif a:code == 80
            "Quick execution, no input
            :wincmd t
            :execute "! javac " l:filename
            :execute "! java " l:onlyname 
        elseif a:code == 85
            "SplitTerminal on same screen
            :wincmd t
            :belowright split | terminal
            :call jobsend(b:terminal_job_id, "javac ".l:filename."\n")
            :call feedkeys("a")
            :call jobsend(b:terminal_job_id, "java ".l:onlyname."\n")
        elseif a:code == 90 
            "Open IO
            :call Run_Super_OpenIO()
            "This doesn't work if input and output not already created
            :execute "silent ! javac " l:filename
            :execute "silent ! java " l:onlyname "< input.txt > output.txt"
        endif
        "------------------------------------------------
    endif
endfunction

"<F4> for templates only
noremap <F4>  :call Run_Super(40)<CR>
"ctrl<F4> to save and open with text editor
noremap <F28> :call Run_Super(45)<CR>
noremap <F5>  :call Run_Super(50)<CR>
"ctrl <F5> is used for clang formatting. See after line 1415
"noremap <F29> :call Run_Super(55)<CR>
noremap <F6>  :call Run_Super(60)<CR>
noremap <F30> :call Run_Super(65)<CR>
"<F7> for build or some other function that runs with error window open
noremap <F7>  :call Run_Super(70)<CR>
noremap <F31> :call Run_Super(75)<CR>
noremap <F8>  :call Run_Super(80)<CR>
noremap <F32> :call Run_Super(85)<CR>
"<F9> will be main run function
noremap <F9>  :call Run_Super(90)<CR>
"ctrl<F9> will be secondary run option, like print debug and longer
"time limits  (live-server for WebD)
noremap <F33> :call Run_Super(95)<CR>


" Need to install using apt -> clang-format-9
" Check file locations by dpkg -L clang-format-9
" Generate style file by clang-format-9 -style=webkit -dump-config >
" .clang-format
" CLANG FORMAT LOC 
" /usr/share/vim/addons/syntax/clang-format-9.py
map <F29> :1,$pyf /usr/share/clang/clang-format-9/clang-format.py<cr>
imap <F29> <c-o>:1,$pyf /usr/share/clang/clang-format-9/clang-format.py<cr>

function! Formatonsave()
  let l:formatdiff = 1
  pyf /usr/share/clang/clang-format-9/clang-format.py
endfunction

function! FormatInbuilt()
    :exe "normal vggG$="
endfunction

autocmd BufWritePre *.h,*.cc,*.cpp,*.java,*.js,*.c,*.html,*.css,*.hbs,*.vue call FormatInbuilt()
