runtime! autoload/pathogen.vim

syntax on
filetype plugin indent on

if exists('g:loaded_pathogen')
  execute pathogen#infect()
endif

augroup vimrc
  autocmd!
  autocmd GuiEnter * set columns=120 lines=70 number
augroup END

set nocompatible "required by Vundle
filetype off     "required by Vundle

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

" let Vundle manage Vundle, required
call vundle#begin() "required
Plugin 'ervandew/supertab'
Plugin 'godlygeek/tabular'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-pathogen'
Plugin 'tpope/vim-ragtag'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'vim-scripts/bufexplorer.zip'
Plugin 'jgdavey/tslime.vim'
Plugin 'gregsexton/gitv'
Plugin 'rondale-sc/vim-spacejam'
Plugin 'tpope/vim-dispatch'
Plugin 'milkypostman/vim-togglelist'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'scrooloose/syntastic'
Plugin 'vim-scripts/IndexedSearch'
Plugin 'goldfeld/vim-seek'
Plugin 'Rykka/lastbuf.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'rking/ag.vim'
Plugin 'bling/vim-airline'
Plugin 'kchmck/vim-coffee-script'
Plugin 'leshill/vim-json'
Plugin 'pangloss/vim-javascript'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-rake'
Plugin 'tpope/vim-rails'
Plugin 'vim-ruby/vim-ruby'
Plugin 'jgdavey/vim-turbux'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'thoughtbot/vim-rspec'

call vundle#end()         " required
filetype plugin indent on " required

" colorscheme
colorscheme monokai

" Add comma as leader
:nmap , \

set background=dark
set shell=bash
set guifont=Monaco:h16
set guioptions-=T guioptions-=e guioptions-=L guioptions-=r
set visualbell
set encoding=utf-8
set ruler "show the cursor position all the time
set showcmd " display incomplete commands
set autowrite " Automatically :write before running commands
set hidden

" Better search behavior
set hlsearch
set incsearch
set ignorecase
set smartcase

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

"number configuration
set number
set numberwidth=1

" use tab with 2 spaces
set softtabstop=2
set shiftwidth=2
set tabstop=2
set expandtab

" show matching of (, ] {
set showmatch
" 0 seconds between showing matches
set matchtime=0

" Don't scroll off the edge of the page
set scrolloff=5

" Unhighlight search results
map <Leader><space> :nohl<cr>

" Quicker window movement
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" vim tab navigation
nnoremap th :tabfirst<CR>
nnoremap tj :tabprev<CR>
nnoremap tk :tabnext<CR>
nnoremap tl :tablast<CR>
nnoremap tc :tabclose<CR>
nnoremap tn :tabnew<CR>

" disable arrow navigation keys
inoremap  <Up>    <NOP>
inoremap  <Down>  <NOP>
inoremap  <Left>  <NOP>
inoremap  <Right> <NOP>
noremap   <Up>    <NOP>
noremap   <Down>  <NOP>
noremap   <Left>  <NOP>
noremap   <Right> <NOP>

" format JSON
nnoremap <leader>j :%!python -m json.tool<cr>

" git commit messages get 50/72 vertical bars
autocmd BufNewFile,BufRead COMMIT_EDITMSG set colorcolumn=60,80

"select current word using space
map , viw

" move lines
no <down> ddp
no <up> ddkP

" surround current word with "
noremap <leader>2 viw<esc>a"<esc>hbi"<esc>lel

" indent all file
map <leader>i mmgg=G'm<CR>

"paste from clipboard
map <Leader>p :set paste<CR>o<esc>"*]p:set nopaste<cr>
"copy to clipboard
map <leader>y "+y
"copy currentline to clipboard
map <leader>Y "+y

"shortcut exit  insert mode
imap jk <esc>
"shortcut exit  visual mode
vmap <leader>jk <esc>
"shortcut for save :write  on visual mode
nmap s :wa<cr>
nmap S :x<cr>
"shortcut for close (:q) buffer
map <leader>q <esc>:q<cr>
map <leader>Q <esc>:q!<cr>
"Quick save to repo as WIP
map <Leader>gwip :!git add . && git commit -m 'WIP' && git push origin<cr>
"mapping for GIT
map gt :Gstatus<cr>
"Easymotion mapping
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)
nmap <Leader>f <Plug>(easymotion-s2)
nmap <Leader>t <Plug>(easymotion-t2)

set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline_section_y= '%{strftime("%c")}'

" vim tab navigation

nnoremap th :tabfirst<CR>
nnoremap tj :tabprev<CR>
nnoremap tk :tabnext<CR>
nnoremap tl :tablast<CR>
nnoremap tc :tabclose<CR>
nnoremap tn :tabnew<CR>


"I really hate that things don't auto-center
nmap G Gzz
nmap n nzz
nmap N Nzz
nmap } }zz
nmap { {zz

"quick pairs
inoremap ' ''<ESC>i
inoremap " ""<ESC>i
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
" RSpec.vim mappings
nmap ,t :call RunCurrentSpecFile()<CR>
nmap ,s :call RunNearestSpec()<CR>
nmap ,l :call RunLastSpec()<CR>
nmap ,a :call RunAllSpecs()<CR>
" let g:rspec_runner = "os_x_iterm"
let g:rspec_command = "call Send_to_Tmux('spring rspec {spec}\n')"
let g:user_emmet_leader_key='<Tab>'
" map for commetary usin cm is more friendly"
map cm gc
" use F to search"
noremap F /

" ctrlp.vim config
if get(g:, 'loaded_ctrlp', 1)
  let g:ctrlp_match_window_reversed = 0
  let g:ctrlp_working_path_mode = 'a'
  let g:ctrlp_max_height = 20
  let g:ctrlp_match_window_bottom = 0
  let g:ctrlp_switch_buffer = 0
  let g:ctrlp_custom_ignore = {
  \ 'dir':  'tmp|.bundle|.git|node_modules|vendor|bower_components$',
  \ 'file': '\.so$\|\.dat$|\.DS_Store$'
  \ }
endif

" NERDTree config
let NERDTreeIgnore=['\~$', 'tmp', '\.git', '\.bundle', '.DS_Store', 'tags', '.swp']
let NERDTreeShowHidden=1
map <Leader>n :NERDTreeToggle<CR>
map <Leader>fnt :NERDTreeFind<CR>

" Disable vim backups
set nobackup

" Disable swapfile
set noswapfile
