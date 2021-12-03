set nocompatible

runtime! macros/matchit.vim

syntax on

set tags=./tags,./TAGS,tags,TAGS
set encoding=utf-8
set fileformats=unix,dos,mac

set softtabstop=2
set tabstop=2                     " Like emacs tab-width variable
set shiftwidth=2                  " Like emacs c-basic-offset variable
set expandtab                     " Use spaces, not tabs (optional)
set backspace=indent,eol,start    " Backspace through everything in insert mode"
set autoindent                    " Match indentation of previous line
set smartindent
set et
set backspace=2                   " make backspace work like most other apps"

set autoread
set belloff=all
set complete-=i
set display+=lastline
set formatoptions=tcqj
set smarttab
set tabpagemax=50
set langnoremap
set langremap
set listchars="tab:> ,trail:-,nbsp:+"
set nrformats="bin,hex"
set sessionoptions-=options
set completeopt=longest,menuone

set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.
set showmatch                     " Show matching brackets/parenthesis
set hidden                        " Handle multiple buffers better.
set title                         " Set the terminal's title
set number                        " Show line numbers.
set ruler                         " Show the cursor position all the time
set scrolloff=1
set sidescrolloff=5
set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.
set wildignore+=*/node_modules/*,*/tmp/**,*.so,*.swp,*.zip,*~     " Stuff to ignore when tab completing (MacOSX/Linux)
set visualbell
set noerrorbells
set laststatus=2                  " Show the status line all the time

" performance
set ttyfast
set lazyredraw
set cursorline
" set relativenumber
set synmaxcol=200
set foldmethod=manual
" set foldmethod=indent

set undofile
set nobackup                      " Don't make a backup before overwriting a file.
set noswapfile
set history=50                    " Keep 50 lines of command line history
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
set textwidth=90
set colorcolumn=95

" disable mouse
set mouse=r

" Disable arrow keys completely in Insert Mode
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Split windows
nnoremap <leader>wv <C-w>v<C-w>l
nnoremap <leader>ws <C-w>s<C-w>j
" nnoremap <C-h> <C-w>h
" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k
" nnoremap <C-l> <C-w>l

" Setting Arrow Keys to Resize Panes
nnoremap <Left> :vertical resize -1<CR>
nnoremap <Right> :vertical resize +1<CR>
nnoremap <Up> :resize -1<CR>
nnoremap <Down> :resize +1<CR>

inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
inoremap jj <ESC>

nnoremap <tab> %
vnoremap <tab> %
nnoremap / /\v
vnoremap / /\v

let mapleader = ","
nnoremap <leader><space> :noh<cr>
" Strip all trailing whitespace in the current file
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gv :Gvdiff<CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gg :Ggrep! <Bar> copen
nnoremap <leader>rg :Grepper -tool rg<cr>
nnoremap <leader>; :Files<cr>

" Finds and replaces in files based on the the current line.
map <leader>cdo :cdo s///gc <Bar> update

" Substitute all occurrences of the word under the cursor
nnoremap <leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>

" I work with HTML often, so I have ,ft mapped to a “fold tag” function
nnoremap <leader>ft Vatzf
" I also work with Nick Sergeant and he likes his CSS properties sorted, so here’s a ,S mapping that sorts them for me
nnoremap <leader>S ?{<CR>jV/^\s*\}?$<CR>k:sort<CR>:noh<CR>
" This next mapping imitates TextMates Ctrl+Q function to re-hardwrap paragraphs of text
nnoremap <leader>q gqip
" I have a ,v mapping to reselect the text that was just pasted so I can perform commands (like indentation) on it
nnoremap <leader>v V`]
" It pastes, visually selects pasted text and then re-indents it
nnoremap <leader>p p`[v`]=
" This last mapping lets me quickly open up my ~/.vimrc file in a vertically split window
nnoremap <leader>E <C-w>v<C-w>l :e $MYVIMRC<cr>
nnoremap <leader>R :source $MYVIMRC<cr>

" Shortcut to rapidly toggle `set list`
nnoremap <leader>l :set list!<CR>

" YankRing
nnoremap <leader>y :YRShow<CR>

" netrw
map <leader>hn :help netrw-quickmap<CR>

" vimux
" Run the current file with rails test
map <Leader>rb :call VimuxRunCommand("clear; bin/rails test " . bufname("%"))<CR>
" Prompt for a command to run
map <Leader>vp :VimuxPromptCommand<CR>
" Run last command executed by VimuxRunCommand
map <Leader>vl :VimuxRunLastCommand<CR>
" Inspect runner pane
map <Leader>vi :VimuxInspectRunner<CR>
" Close vim tmux runner opened by VimuxRunCommand
map <Leader>vq :VimuxCloseRunner<CR>
" Interrupt any command running in the runner pane
map <Leader>vx :VimuxInterruptRunner<CR>
" Zoom the runner pane (use <bind-key> z to restore runner pane)
map <Leader>vz :call VimuxZoomRunner()<CR>
"--------------------------------------------

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'

" language
Plug 'vim-ruby/vim-ruby'
Plug 'hail2u/vim-css3-syntax'
" Plug 'pangloss/vim-javascript'
Plug 'pearofducks/ansible-vim'
Plug 'chr4/nginx.vim'
Plug 'yuezk/vim-js'
Plug 'HerringtonDarkholme/yats.vim'
" or Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'
" Plug 'mustache/vim-mustache-handlebars'
" Plug 'kchmck/vim-coffee-script'
" Plug 'jimenezrick/vimerl'
" Plug 'rhysd/vim-crystal'
" Plug 'udalov/kotlin-vim'

" tools
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'Yggdroot/indentLine'
Plug 'christoomey/vim-tmux-navigator'
Plug 'benmills/vimux'
Plug 'janko-m/vim-test'
Plug 'Lokaltog/vim-easymotion'
Plug 'mhinz/vim-grepper'
Plug 'Raimondi/delimitMate' " Automatic closing of quotes, parenthesis, brackets, etc.
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'vim-scripts/YankRing.vim'
" Plug 'godlygeek/tabular'

" modern vim
Plug 'dense-analysis/ale'
Plug '/usr/local/opt/fzf'
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" color theme
Plug 'dracula/vim'
Plug 'morhetz/gruvbox'
Plug 'w0ng/vim-hybrid'
Plug 'nanotech/jellybeans.vim'
call plug#end()

" *********************************************
" *           Plugin Customization            *
" *********************************************

" disable annoying popup
" Place it after you initialize Syntastic and Pathogen, if you use those plugins.
set noballooneval
set balloondelay=100000
setlocal balloonexpr=

" netrw
" Allow netrw to remove non-empty local directories
let g:netrw_localrmdir="rm -rf"

" indentLine
let g:indentLine_enabled = 0
let g:indentLine_char = "⟩"

" vim-airline
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1
set laststatus=2

" vim-gitgutter
let g:gitgutter_enabled = 1

" vim-ruby
" compiler ruby         " Enable compiler support for ruby
" let g:ruby_operators = 1
" let g:ruby_space_errors = 1
" let g:ruby_fold = 1
" let g:ruby_no_expensive = 0
" let g:ruby_minlines = 500
" let g:rubycomplete_buffer_loading = 1
" let g:rubycomplete_classes_in_global = 1
" let g:rubycomplete_rails = 1

" vim-test
" let test#strategy = "vimux"
let test#strategy = "vimterminal"
nnoremap <leader>tn :TestNearest<cr>
nnoremap <leader>tf :TestFile<cr>
nnoremap <leader>ts :TestSuite<cr>
nnoremap <leader>tl :TestLast<cr>
nnoremap <leader>tg :TestVisit<cr>
" these "Ctrl mappings" work well when Caps Lock is mapped to Ctrl
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-t> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>

" ale
let g:ale_linter_aliases = {'javascriptreact': ['css', 'javascript']}
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'ruby': ['ruby', 'rubocop'],
\   'javascriptreact': ['stylelint', 'eslint']
\}
let g:ale_fixers = { 'ruby': ['rubocop'], 'javascript': ['eslint'] }
let g:ale_lint_on_save = 1
let g:airline#extensions#ale#enabled = 1
" let g:ale_javascript_standard_executable = 'standardx'
" let g:ale_ruby_rubocop_executable = 'bin/rubocop'

" extra rails.vim help
let g:rails_projections = {
      \ "app/javascript/controllers/*_controller.js": {
      \   "command": "stimulus",
      \   "template":
      \     ["import { Controller } from 'stimulus'",
      \        "export default class extends Controller {",
      \      "}"],
      \   "rubyMacro": ["process", "version"]
      \ },
      \ "app/services/*_service.rb": {
      \   "command": "service",
      \   "test": [
      \     "test/unit/{}_service_test.rb",
      \     "spec/models/{}_service_spec.rb"
      \   ],
      \   "keywords": "process version"
      \ },
      \ "app/forms/*_form.rb": {
      \   "command": "form",
      \   "test": [
      \     "test/unit/{}_form_test.rb",
      \     "spec/models/{}_form_spec.rb"
      \   ],
      \   "keywords": "process version"
      \ },
      \ "app/chewy/*_index.rb": {
      \   "command": "chewy",
      \   "template":
      \     ["class {camelcase|capitalize|colons}Index < "
      \      . "Chewy::Index", "end"],
      \   "test": [
      \     "test/unit/{}_index_test.rb",
      \     "spec/models/{}_index_spec.rb"
      \   ],
      \   "keywords": "process version"
      \ },
      \ "app/uploaders/*_uploader.rb": {
      \   "command": "uploader",
      \   "template":
      \     ["class {camelcase|capitalize|colons}Uploader < "
      \      . "CarrierWave::Uploader::Base", "end"],
      \   "test": [
      \     "test/unit/{}_uploader_test.rb",
      \     "spec/models/{}_uploader_spec.rb"
      \   ],
      \   "keywords": "process version"
      \ },
      \ "app/policies/*_policy.rb": {
      \   "command": "policy",
      \   "template":
      \     ["class {camelcase|capitalize|colons}Policy < "
      \      . "ApplicationPolicy", "end"],
      \   "test": [
      \     "test/unit/{}_policy_test.rb",
      \     "spec/models/{}_policy_spec.rb"
      \   ],
      \   "keywords": "process version"
      \ }}

if has("gui_running")
  set guioptions=-t
  set guifont=Hermit\ medium:h14
else
  " set termguicolors
  let g:dracula_italic = 0
  let g:dracula_colorterm = 0
endif

" colorscheme
colorscheme dracula
" colorscheme gruvbox
" colorscheme hybrid
" colorscheme jellybeans

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

 " Syntax of these languages is fussy over tabs Vs spaces
  autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
  autocmd FileType kotlin setlocal ts=4 sts=4 sw=4 expandtab
  autocmd FileType java setlocal ts=4 sts=4 sw=4 expandtab

  " run this command automatically when a file is saved
  autocmd BufWritePre .vimrc,*.rb,*.erb,*.css,*.scss,*.html,*.js,*.yml :call Preserve("%s/\\s\\+$//e")
  " autocmd FileType ruby,css,scss,html,javascript,yaml,c,cpp,java,php autocmd BufWritePre <buffer> %s/\s\+$//e

  " inky & ecr
  autocmd BufRead,BufNewFile *.mjml set filetype=html.eruby
  autocmd BufRead,BufNewFile *.inky set filetype=html.eruby
  autocmd BufRead,BufNewFile *.ecr set filetype=html.eruby
  au BufRead,BufNewFile nginx.conf.j2 set filetype=nginx.jinja2
  au BufRead,BufNewFile */ansible/*.yml set filetype=yaml.ansible
endif

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
