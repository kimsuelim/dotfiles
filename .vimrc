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
set scrolloff=3
set showmatch
set laststatus=2
set statusline=\(%n\)%<%f\ %h%m%r%=0x%B\ \ \ \ %-14.(%l,%c%V%)\ %P
set number
syntax on

set tags=./tags,./TAGS,tags,TAGS
nmap <F8> :TagbarToggle<CR>

set fileencodings=ucs-bom,utf-8,korea,iso-2022-kr
set termencoding=utf-8
set encoding=utf-8

set softtabstop=2
set tabstop=2 " like emacs tab-width variable
set shiftwidth=2 "like emacs c-basic-offset variable
"set smarttab
set expandtab "like emacs indent-tabs-mode nil
set autoindent
set smartindent
set et

set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set backspace=indent,eol,start
set relativenumber
set undofile

set nobackup		" do not keep a backup file, use versions instead
set noswapfile
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set showmode
set clipboard=unnamed

" searching/moving
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch		" do incremental searching
set incsearch
set showmatch
set hlsearch
"--------------------------------------------

"handle long lines correctly
set wrap
set linebreak
set textwidth=80
set formatoptions=qrn1
set colorcolumn=85
"--------------------------------------------

"set list
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

"ruby
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
"improve autocomplete menu color
highlight Pmenu ctermbg=238 gui=bold
highlight PMenu gui=bold guibg=#CECECE guifg=#444444

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
nnoremap ; :
au FocusLost * :wa
inoremap jj <ESC>

" split windows
nnoremap <leader>w <C-w><C-v><C-l>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" YankRing
nnoremap <silent> <F3> :YRShow<cr>
inoremap <silent> <F3> <ESC>:YRShow<cr>

let mapleader = ","
nnoremap <leader><space> :noh<cr>
" strip all trailing whitespace in the current file
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
nnoremap <leader>A :Ack
"I work with HTML often, so I have ,ft mapped to a “fold tag” function
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

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>
"--------------------------------------------

if has("gui_running")
    set guifont=Monaco:h13
    set guifont=ProFontX:h13
    colorscheme idleFingers
endif

colorscheme desert

filetype off                   " required!
"call pathogen#runtime_append_all_bundles()
set modelines=0

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
 " let Vundle manage Vundle
 " required!
Bundle 'glmarik/vundle'

 " My Bundles here:
Bundle 'scrooloose/nerdtree'
Bundle 'The-NERD-Commenter'
Bundle 'ack.vim'
Bundle 'surround.vim'
Bundle 'repeat.vim'
Bundle 'YankRing.vim'
"Bundle 'bundler'
Bundle 'git://github.com/tpope/vim-bundler.git'
Bundle 'Tagbar'
Bundle 'SuperTab-continued.'
Bundle 'clang-complete'

"Bundle 'msanders/snipmate.vim'
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "snipmate-snippets"
Bundle "garbas/vim-snipmate"

Bundle 'matchit.zip'
Bundle 'HTML5-Syntax-File'

" original repos on github
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'tpope/vim-rails.git'
" vim-scripts repos
Bundle 'L9'
Bundle 'FuzzyFinder'
" non github repos
Bundle 'git://git.wincent.com/command-t.git'

filetype plugin indent on     " required!
 "
 " Brief help
 " :BundleList          - list configured bundles
 " :BundleInstall(!)    - install(update) bundles
 " :BundleSearch(!) foo - search(or refresh cache first) for foo
 " :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
 "
 " see :h vundle for more details or wiki for FAQ
 " NOTE: comments after Bundle command are not allowed..

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
  autocmd BufWritePre *.rb,*.erb,*.css,*.scss,*.html,*.py,*.js :call Preserve("%s/\\s\\+$//e")
  
endif
