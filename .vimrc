set nocompatible              " be iMproved, required!

filetype off                  " required


"------------------------------Plugins----------------------------------
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"=======================================================================

 " Vim Tmux Navigator --------------------------------------------------
 Plugin 'christoomey/vim-tmux-navigator'

 " Vim Airline ---------------------------------------------------------
 Plugin 'vim-airline/vim-airline'
 Plugin 'vim-airline/vim-airline-themes'
 let g:airline_powerline_fonts = 1
 let g:airline_theme = 'badwolf'

 " CtrlP ---------------------------------------------------------------
 Plugin 'ctrlpvim/ctrlp.vim'
 let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'
 let g:ctrlp_dotfiles = 0
 set wildignore+=*/tmp/*,*.so,*.swp,*.zip
 let g:ctrlp_map = '<f2>'
 let g:ctrlp_cmd = 'CtrlP .'

 map <Leader>f :CtrlP .<CR>
 map <Leader>b :CtrlPBuffer <CR>

 " Ag search
  Plugin 'rking/ag.vim'

 " NerdTree----------------------------------------------------------------
 Plugin 'scrooloose/nerdtree'

function! ToggleNERDTree()
    let w:jumpbacktohere = 1

    if exists('t:NERDTreeBufName')
        let nerdtree_open = bufwinnr(t:NERDTreeBufName) != -1
    else
        let nerdtree_open = 0
    endif

    if nerdtree_open
        NERDTreeClose
    else
      NERDTreeFind
    endif

endfunction

 map  <Leader>t <ESC>:call ToggleNERDTree()<CR>


 " TODOs
 " TODO: plugin - Ag search
 " TODO: plugin - NerdTree
 " TODO: plugin - SnipMate
 " TODO: plugin - DartVimPlugin
 " TODO: plugin - smth for Kotlin
 " TODO: plugin - TComment

 " TODO try to fix AYU theme
 " AYU colorscheme
 "Plugin 'ayu-theme/ayu-vim'
 "let ayucolor="light"  " for light version of theme
 "let ayucolor="mirage" " for mirage version of theme
 "let ayucolor="dark"   " for dark version of theme

 " Nord colorscheme
 Plugin 'arcticicestudio/nord-vim'
 let g:nord_uniform_status_lines = 1
 let g:nord_cursor_line_number_background = 1
 let g:nord_bold_vertical_split_line = 1
 
 " Kotlin ------
Plugin 'udalov/kotlin-vim' 

"=======================================================================
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
"------------------------------Plugins END------------------------------


"---------------------------Color theme settings------------------------
"set termguicolors     " enable true colors support
colorscheme jellybeans


"---------------------------Main settings-------------------------------
syntax on

" Disable error sound
set noerrorbells

" When the "unnamed" string is included in the 'clipboard' option, the unnamed
" register is the same as the "* register.  Thus you can yank to and paste the
" selection without prepending "* to commands.
set clipboard=unnamed
" Size of history buffers
set history=100

" Allow backspacinng over autoindent, line breaks and start of insert
set backspace=eol,start,indent
" Allow keys(<Left>, <Right>, 'h', 'l') that move the cursor left/right to move 
" to the previous/next line when the cursor is on the first/last character in
" the line.  
set whichwrap+=<,>,h,l
" Display line numbers

set number
" Display relative numbers based on selected line
set relativenumber 
" Minimal number of columns to use for the line number
set numberwidth=1
" In Insert mode: Use the appropriate number of spaces to insert a <Tab>
set expandtab
" Number of spaces that a <Tab> in the file counts for
set tabstop=4
" The number of space characters inserted for indentation
set shiftwidth=4
" Indicates how many columns vim uses when you enter <Tab> in insert mode
set softtabstop=4
" When lines longer than the width of the window will wrap and  displaying 
" continues on the next line.  When off lines will not wrap
set wrap

" Highlight the screen column of the cursor
set cursorcolumn
" Highlight the screen line of the cursor
set cursorline
" Minimal number of screen lines to keep above and below the cursor.
set scrolloff=1

" When on, splitting a window will put the new window below the current one
set splitbelow
" When on, splitting a window will put the new window right of the current one
set splitright

" Comma separated list of options for Insert mode completion
set completeopt=menuone,longest,preview
" When on, the title of the window will be set to the value of 'titlestring
set title
" When 'wildmenu' is on, command-line completion operates in an enhanced mode
set wildmenu
" Completion mode that is used for the character specified with 'wildchar'
set wildmode=list:longest,full

" While typing a search command, show where the pattern, as it was typed 
" so far, matches.  The matched string is highlighted
set incsearch
" When there is a previous search pattern, highlight all its matches.
set hlsearch
" If the 'ignorecase' option is on, the case of normal letters is ignored.
set ignorecase
" Override the 'ignorecase' option if the search pattern contains upper 
" case characters
set smartcase

" Sets the character encoding used inside Vim
set encoding=utf-8
" This option influences when the last window will have a status line - 2: always
set laststatus=2
" Show (partial) command in the last line of the screen
set showcmd

" List mode: display special symbols. Useful to see the difference between
" tabs and spaces and trailing blanks
set list
" Strings to use in 'list' mode and for the |:list| command
set listchars=tab:│┈,trail:·,eol:¬,nbsp:_


"-----------------------------Mapping-----------------------------------
nnoremap _ ddp
nnoremap + dd2kp
inoremap jk <Esc>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <Leader>ev :vsplit $MYVIMRC<CR>
nnoremap <Leader>sv :source $MYVIMRC<CR>

nnoremap <Leader>" viw<Esc>a"<Esc>bi"<Esc>lel
nnoremap <Leader>' viw<Esc>a'<Esc>bi'<Esc>lel
nnoremap <C-p> "*p


"-------------------------Autocommands----------------------------------
autocmd FileType javascript 	nnoremap <buffer> <Localleader>c I//<Esc>
autocmd FileType python		nnoremap <buffer> <Localleader>c I#<Esc>
autocmd FileType javascript 	:iabbrev <buffer> iff if ()<Left>
autocmd FileType python		:iabbrev <buffer> iff if:<Left>
