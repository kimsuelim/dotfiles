" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2002 Sep 19
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.

set nocompatible      " We're running Vim, not Vi!
set statusline=%<%F%h%m%r%h%w%y\ %{&ff}\ %{strftime(\"%c\",getftime(expand(\"%:p\")))}%=\ lin:%l\,%L\ col:%c%V\ pos:%o\ ascii:%b\ %P
syntax on

set tags=./tags,./TAGS,tags,TAGS
nmap <F8> :TagbarToggle<CR>

"set fileencodings=ucs-bom,utf-8,korea,iso-2022-kr
set fileencodings=utf-8,korea,iso-2022-kr
set termencoding=utf-8,korea,iso-2022-kr
set encoding=utf-8
set fileformats=unix,dos,mac

set softtabstop=2
set tabstop=2                     " Like emacs tab-width variable
set shiftwidth=2                  " Like emacs c-basic-offset variable
set expandtab                     " Use spaces, not tabs (optional)
set backspace=indent,eol,start    " Backspace through everything in insert mode"
"set smarttab
set autoindent                    " Match indentation of previous line
set smartindent
set et
set backspace=2                   " make backspace work like most other apps"

set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.
set showmatch                     " Show matching brackets/parenthesis
set hidden                        " Handle multiple buffers better.
set title                         " Set the terminal's title
set number                        " Show line numbers.
set ruler		                      " Show the cursor position all the time
set scrolloff=3
set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.
set wildignore=*.o,*.obj,*~       " Stuff to ignore when tab completing
set visualbell
set noerrorbells
set laststatus=2                  " Show the status line all the time
set ttyfast
set lazyredraw
"set cursorline
"set relativenumber

set undofile
set nobackup                      " Don't make a backup before overwriting a file.
set noswapfile
set history=50		                " Keep 50 lines of command line history
set clipboard=unnamed

" Searching/moving
set incsearch                     " Find as you type search
set hlsearch                      " Highlight search terms
set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.
set gdefault

" Handle long lines correctly
"set wrap
set nowrap                        " Don't wrap lines
set linebreak
set textwidth=80
set formatoptions=qrn1
set colorcolumn=85

" Set list
set listchars=tab:▸\ ,eol:¬

" Shortcut to rapidly toggle `set list`
nnoremap <leader>l :set list!<CR>

" Optimize autocomplete (snipmate, clan_complete, supertab)
" Complete options (disable preview scratch window)
set completeopt=menu,menuone,longest
" Limit popup menu height
"set pumheight=15

" SuperTab option for context aware completion
"let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"

" Disable auto popup, use <Tab> to autocomplete
let g:clang_complete_auto = 0
" Show clang errors in the quickfix window
let g:clang_complete_copen = 1

" vim-ruby
let g:ruby_operators = 1
let g:ruby_space_errors = 1
let g:ruby_fold = 0
let g:ruby_no_expensive = 1
let g:ruby_minlines = 500
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_rails = 1

" Improve autocomplete menu color
highlight PMenu gui=bold guibg=#CECECE guifg=#444444
highlight Pmenu ctermbg=238 gui=bold

" Disable arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
"nnoremap ; :
au FocusLost * :wa
inoremap jj <ESC>

" Split windows
nnoremap <leader>W <C-w><C-v><C-l>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" YankRing
nnoremap <silent> <F3> :YRShow<cr>
inoremap <silent> <F3> <ESC>:YRShow<cr>

let mapleader = ","
nnoremap <leader><space> :noh<cr>
" Strip all trailing whitespace in the current file
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
nnoremap <leader>A :Ack
" I work with HTML often, so I have ,ft mapped to a “fold tag” function
nnoremap <leader>ft Vatzf
" I also work with Nick Sergeant and he likes his CSS properties sorted, so here’s a ,S mapping that sorts them for me
nnoremap <leader>S ?{<CR>jV/^\s*\}?$<CR>k:sort<CR>:noh<CR>
" This next mapping imitates TextMates Ctrl+Q function to re-hardwrap paragraphs of text
nnoremap <leader>q gqip
" I have a ,v mapping to reselect the text that was just pasted so I can perform commands (like indentation) on it
nnoremap <leader>v V`]
" This last mapping lets me quickly open up my ~/.vimrc file in a vertically split window
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>
nnoremap <tab> %
vnoremap <tab> %
nnoremap / /\v
vnoremap / /\v

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" Substitute all occurrences of the word under the cursor
nnoremap <Leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>
"--------------------------------------------


filetype off                   " required!
"call pathogen#runtime_append_all_bundles()
set modelines=0

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
Bundle 'glmarik/vundle'

Bundle 'jgdavey/vim-turbux'
Bundle 'benmills/vimux'

Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-rake'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-bundler'
"Bundle 'tpope/vim-cucumber'
"Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-git'
Bundle 'vim-ruby/vim-ruby'
compiler ruby         " Enable compiler support for ruby
Bundle 'nelstrom/vim-textobj-rubyblock'
" Trigger by press var and vir
Bundle 'kana/vim-textobj-user'
Bundle 'nono/vim-handlebars'

Bundle 'altercation/vim-colors-solarized'

Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/syntastic'

Bundle 'miripiruni/CSScomb-for-Vim'
Bundle 'othree/html5.vim'
Bundle 'ChrisYip/Better-CSS-Syntax-for-Vim'
Bundle 'pangloss/vim-javascript'
Bundle 'kchmck/vim-coffee-script'
Bundle 'mattn/zencoding-vim'

Bundle 'Lokaltog/vim-easymotion'
Bundle 'kien/ctrlp.vim'
Bundle 'mileszs/ack.vim'

" Pasting in Vim with indentation adjusted to destination context.
Bundle 'sickill/vim-pasta'

" Automatic closing of quotes, parenthesis, brackets, etc.
Bundle 'Raimondi/delimitMate'

Bundle 'kien/rainbow_parentheses.vim'
Bundle 'ervandew/supertab'
Bundle 'YankRing.vim'
Bundle 'Tagbar'
Bundle 'clang-complete'

" Bumped to version 2.3
Bundle 'kimsuelim/Conque-Shell'

Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "snipmate-snippets"
Bundle "garbas/vim-snipmate"

" vim-scripts repos
" Extend % function to ruby or python and etc...
Bundle 'vim-scripts/matchit.zip'
" redefines 6 search commands (/,?,n,N,*,#). At every
" search command, it automatically prints
" At match #N out of M matches".
" press \\ => for Checking At which Match Number You Are
Bundle 'vim-scripts/IndexedSearch'
Bundle 'vim-scripts/L9.git'
Bundle 'vim-scripts/FuzzyFinder'

" non github repos
Bundle 'git://git.wincent.com/command-t.git'

filetype plugin indent on         " load file type plugins + indentation
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..


" *********************************************
" *           Plugin Customization            *
" *********************************************

if has("gui_running")
  set background=dark
    set guifont=Monaco:h11
    "set guifont=ProFontX:h13

    set guioptions=-t
    "colorscheme idleFingers
    colorscheme solarized
else
  set background=dark
  colorscheme desert
  "colorscheme solarized
endif

"# ctrlp.vim
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*   " for Linux/MacOSX

"# othree/html5.vim
"Disable event-handler attributes support:
let g:html5_event_handler_attributes_complete = 0

"Disable RDFa attributes support:
let g:html5_rdfa_attributes_complete = 0

"Disable microdata attributes support:
let g:html5_microdata_attributes_complete = 0

"Disable WAI-ARIA attribute support:
let g:html5_aria_attributes_complete = 0


"# kien/rainbow_parentheses.vim
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
"au Syntax * RainbowParenthesesLoadChevrons

" vimux
let g:VimuxHeight = "30"
let g:VimuxOrientation = "h"

" turbux
"let g:turbux_command_prefix = 'bundle exec'
let g:turbux_command_test_unit = 'spring test'
"let g:turbux_command_test_unit = 'bin/test'

" Tidying whitespace
function! Preserve(command)
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  execute a:command
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction
nmap _$ :call Preserve("%s/\\s\\+$//e")<CR>
nmap _= :call Preserve("normal gg=G")<CR>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

if has("autocmd")
 " When editing a file, always jump to the last known cursor position.
 " Don't do it when the position is invalid or when inside an event handler
 " (happens when dropping a file on gvim).
 " Also don't do it when the mark is in the first line, that is the default
 " position when opening a file.
 autocmd BufReadPost *
       \ if line("'\"") > 1 && line("'\"") <= line("$") |
       \   exe "normal! g`\"" |
       \ endif

  augroup END

 " Syntax of these languages is fussy over tabs Vs spaces
  autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

  " Customisations based on house-style (arbitrary)
  autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType javascript setlocal ts=2 sts=2 sw=2 expandtab

  " Treat .rss files as XML
  autocmd BufNewFile,BufRead *.rss setfiletype xml

  " run this command automatically when a file is saved
  autocmd BufWritePre .vimrc,*.rb,*.erb,*.css,*.scss,*.html,*.py,*.js,*.coffee :call Preserve("%s/\\s\\+$//e")

  au BufRead,BufNewFile *.rabl setf ruby
  au BufRead,BufNewFile *.rabl syn keyword rubyRabl node attribute object child collection attributes glue extends
  au BufRead,BufNewFile *.rabl hi def link rubyRabl Function

  " Better CSS Syntax for Vim
  au BufRead,BufNewFile *.sass set filetype=css
endif
