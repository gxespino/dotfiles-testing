"====================================================
"VUNDLE STUFF
"====================================================
set nocompatible
syntax enable
set t_ut=
filetype on " without this vim emits a zero exit status, later, because of :ft off
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'altercation/vim-colors-solarized'
Plugin 'austintaylor/vim-indentobject'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'juvenn/mustache.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'rking/ag.vim'
Plugin 'garbas/vim-snipmate'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'nono/vim-handlebars'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'slim-template/vim-slim'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-cucumber'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-pastie'
Plugin 'tpope/vim-ragtag'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-vividchalk'
Plugin 'eventualbuddha/vim-protobuf'
Plugin 'vim-ruby/vim-ruby'
Plugin 'vim-scripts/Align'
Plugin 'vim-scripts/greplace.vim'
Plugin 'vim-scripts/matchit.zip'
Plugin 'vim-airline/vim-airline'
Plugin 'junegunn/vim-easy-align'
Plugin 'epilande/vim-react-snippets'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'janko-m/vim-test'
Plugin 'elixir-lang/vim-elixir'
Plugin 'Quramy/vim-js-pretty-template'
Plugin 'vimoutliner/vimoutliner'

call vundle#end()

" ensure ftdetect et al work by including this after the Vundle stuff
filetype plugin indent on

set autoindent
set autoread                                                 " reload files when changed on disk, i.e. via `git checkout`
set backspace=2                                              " Fix broken backspace in some setups
set backupcopy=yes                                           " see :help crontab
set clipboard=unnamed                                        " yank and paste with the system clipboard
set directory-=.                                             " don't store swapfiles in the current directory
set encoding=utf-8
set expandtab                                                " expand tabs to spaces
set ignorecase                                               " case-insensitive search
set incsearch                                                " search as you type
set laststatus=2                                             " always show statusline
set lazyredraw
set list                                                     " show trailing whitespace
set listchars=tab:▸\ ,trail:▫
set number                                                   " show line numbers
set ruler                                                    " show where you are
set scrolloff=4                                              " show context above/below cursorline
set shiftwidth=2                                             " normal mode indentation commands use 2 spaces
set showcmd
set smartcase                                                " case-sensitive search if any caps
set softtabstop=2                                            " insert mode tab and backspace use 2 spaces
set tabstop=8                                                " actual tabs occupy 8 characters
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc
set wildmenu                                                 " show a navigable menu for tab completion
set wildmode=longest,list,full
set nocursorcolumn                                           " do not highlight column
set nocursorline                                             " do not highlight line
syntax sync minlines=256                                     " start highlighting from 256 lines backwards
set synmaxcol=300                                            " do not highlith very long lines
set re=1                                                     " use explicit old regexpengine, seems to be more faster

" Enable basic mouse behavior such as resizing buffers.
set mouse=a
if exists('$TMUX')  " Support resizing in tmux
  " set ttymouse=xterm2
endif

" keyboard shortcuts
let mapleader = ','
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
nnoremap <leader>a :Ag<space>
nnoremap <leader>b :CtrlPBuffer<CR>
nnoremap <leader>d :NERDTreeToggle<CR>
nnoremap <leader>t :CtrlP<CR>
nnoremap <leader>T :CtrlPClearCache<CR>:CtrlP<CR>
nnoremap <leader>] :TagbarToggle<CR>
nnoremap <leader><space> :call whitespace#strip_trailing()<CR>
nnoremap <leader>g :GitGutterToggle<CR>
noremap <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" Tests
nmap <silent> <leader>n :TestNearest<CR>
nmap <silent> <leader>f :TestFile<CR>
nmap <silent> <leader>s :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>

" in case you forgot to sudo
cnoremap w!! %!sudo tee > /dev/null %

" plugin settings
let g:ctrlp_match_window = 'order:ttb,max:20'
let g:NERDSpaceDelims=1
let g:gitgutter_enabled = 0

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" fdoc is yaml
autocmd BufRead,BufNewFile *.fdoc set filetype=yaml
" md is markdown
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile *.md set spell
" extra rails.vim help
autocmd User Rails silent! Rnavcommand decorator      app/decorators            -glob=**/* -suffix=_decorator.rb
autocmd User Rails silent! Rnavcommand observer       app/observers             -glob=**/* -suffix=_observer.rb
autocmd User Rails silent! Rnavcommand feature        features                  -glob=**/* -suffix=.feature
autocmd User Rails silent! Rnavcommand job            app/jobs                  -glob=**/* -suffix=_job.rb
autocmd User Rails silent! Rnavcommand mediator       app/mediators             -glob=**/* -suffix=_mediator.rb
autocmd User Rails silent! Rnavcommand stepdefinition features/step_definitions -glob=**/* -suffix=_steps.rb
" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" Fix Cursor in TMUX
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

set noswapfile
" Don't copy the contents of an overwritten selection.
vnoremap p "_dP
let g:jsx_ext_required = 0
" Go crazy!
if filereadable(expand("~/.vimrc.local"))
  " In your .vimrc.local, you might like:
  "
  " set autowrite
  " set nocursorline
  " set nowritebackup
  " set whichwrap+=<,>,h,l,[,] " Wrap arrow keys between lines
  "
  " autocmd! bufwritepost .vimrc source ~/.vimrc
  " noremap! jj <ESC>
  source ~/.vimrc.local
endif

" Set filetype recognition for filetypes not recognized
autocmd BufNewFile,BufRead .babelrc set filetype=json
autocmd BufNewFile,BufRead Vagrantfile set filetype=ruby
autocmd BufNewFile,BufRead Dockerfile-* set filetype=dockerfile
autocmd BufNewFile,BufRead hosts set filetype=dosini
autocmd BufNewFile,BufRead supervisord.conf set filetype=dosini
autocmd BufNewFile,BufRead .tmux.conf set filetype=sh
autocmd BufNewFile,BufRead */nginx/*/default set filetype=nginx
autocmd BufNewFile,BufRead .tern-project set filetype=json
autocmd BufNewFile,BufRead Jenkinsfile set filetype=groovy

set runtimepath^=~/.vim/bundle/html-improved/html.vim

"==============================================================
"vimrc.local
"==============================================================
set nocursorline " don't highlight current line

" keyboard shortcuts
inoremap jj <ESC>

" highlight search
"set hlsearch
"nmap <leader>hl :let @/ = ""<CR>

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" gui settings
if (&t_Co == 256 || has('gui_running'))
  if ($TERM_PROGRAM == 'iTerm.app')
    syntax enable
    syntax on
    colorscheme onedark
  else
    syntax on
    syntax enable
    colorscheme onedark
  endif
endif

if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

if (has("termguicolors"))
  set termguicolors
endif

function! s:RemoveConflictingAlignMaps()
  if exists("g:loaded_AlignMapsPlugin")
    AlignMapsClean
  endif
endfunction
command! -nargs=0 RemoveConflictingAlignMaps call s:RemoveConflictingAlignMaps()
silent! autocmd VimEnter * RemoveConflictingAlignMaps

nnoremap <leader>2 :vert sb<CR>
"set cursorline
"
"# filenames like *.xml, *.html, *.xhtml, ...
let g:closetag_filenames = "*.html,*.xhtml,*.erb"
set cursorline

" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')
Plug 'janko-m/vim-test'
Plug 'mhinz/vim-startify'
call plug#end()

" SPLASH!
" let g:startify_custom_header = [
"       \'  ▄████ ▒██   ██▒▓█████   ██████  ██▓███   ██▓ ███▄    █  ▒█████  ',
"       \' ██▒ ▀█▒▒▒ █ █ ▒░▓█   ▀ ▒██    ▒ ▓██░  ██▒▓██▒ ██ ▀█   █ ▒██▒  ██▒',
"       \'▒██░▄▄▄░░░  █   ░▒███   ░ ▓██▄   ▓██░ ██▓▒▒██▒▓██  ▀█ ██▒▒██░  ██▒',
"       \'░▓█  ██▓ ░ █ █ ▒ ▒▓█  ▄   ▒   ██▒▒██▄█▓▒ ▒░██░▓██▒  ▐▌██▒▒██   ██░',
"       \'░▒▓███▀▒▒██▒ ▒██▒░▒████▒▒██████▒▒▒██▒ ░  ░░██░▒██░   ▓██░░ ████▓▒░',
"       \' ░▒   ▒ ▒▒ ░ ░▓ ░░░ ▒░ ░▒ ▒▓▒ ▒ ░▒▓▒░ ░  ░░▓  ░ ▒░   ▒ ▒ ░ ▒░▒░▒░ ',
"       \'  ░   ░ ░░   ░▒ ░ ░ ░  ░░ ░▒  ░ ░░▒ ░      ▒ ░░ ░░   ░ ▒░  ░ ▒ ▒░ ',
"       \'░ ░   ░  ░    ░     ░   ░  ░  ░  ░░        ▒ ░   ░   ░ ░ ░ ░ ░ ▒  ',
"       \'      ░  ░    ░     ░  ░      ░            ░           ░     ░ ░  ',
"       \]

let g:startify_custom_header = [
      \'      ___           ___           ___           ___           ___                     ___           ___     ',
      \'     /  /\         /__/|         /  /\         /  /\         /  /\      ___          /__/\         /  /\    ',
      \'    /  /:/_       |  |:|        /  /:/_       /  /:/_       /  /::\    /  /\         \  \:\       /  /::\   ',
      \'   /  /:/ /\      |  |:|       /  /:/ /\     /  /:/ /\     /  /:/\:\  /  /:/          \  \:\     /  /:/\:\  ',
      \'  /  /:/_/::\   __|__|:|      /  /:/ /:/_   /  /:/ /::\   /  /:/~/:/ /__/::\      _____\__\:\   /  /:/  \:\ ',
      \' /__/:/__\/\:\ /__/::::\____ /__/:/ /:/ /\ /__/:/ /:/\:\ /__/:/ /:/  \__\/\:\__  /__/::::::::\ /__/:/ \__\:\',
      \' \  \:\ /~~/:/    ~\~~\::::/ \  \:\/:/ /:/ \  \:\/:/~/:/ \  \:\/:/      \  \:\/\ \  \:\~~\~~\/ \  \:\ /  /:/',
      \'  \  \:\  /:/      |~~|:|~~   \  \::/ /:/   \  \::/ /:/   \  \::/        \__\::/  \  \:\  ~~~   \  \:\  /:/ ',
      \'   \  \:\/:/       |  |:|      \  \:\/:/     \__\/ /:/     \  \:\        /__/:/    \  \:\        \  \:\/:/  ',
      \'    \  \::/        |  |:|       \  \::/        /__/:/       \  \:\       \__\/      \  \:\        \  \::/   ',
      \'     \__\/         |__|/         \__\/         \__\/         \__\/                   \__\/         \__\/    ',
      \]
