
"######## KEY MAPPINGS #########""

let mapleader = ","
inoremap jj <ESC>

" move to next buffer
nmap <leader>bk :bnext<CR>
"move to previous buffer
nmap <leader>bj :bprevious<CR>
"close current buffer and move to previous one
nmap <leader>bq :bp <BAR> bd #<CR>
"show all open buffers and their status
nmap <leader>b1 :ls<CR>

map <leader>k :E<cr>
vnoremap <leader>y "*y

"backup and swap files in their own directory
set backupdir=~/.vim/backup
set directory=~/.vim/swap

map \\ <C-^>

" Map ,e and ,v to open files in the same directory as the curent file
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>e :edit %%
map <leader>v :view %%

"save session
"(re-open with 'vi -S')
nnoremap <leader>s :mksession<CR>
nnoremap <leader>s! :mksession!<CR>

"fold with space
nnoremap <space> za

"Movement
nnoremap j gj
nnoremap k gk
" move to beginning/end of line
nnoremap B ^
vnoremap B ^
nnoremap E $
vnoremap E $

" provide hjkl in Insert mode and Command-line mode via <Alt> modifier
noremap! <A-h> <Left>
noremap! <A-j> <Down>
noremap! <A-k> <Up>
noremap! <A-l> <Right>

"turn off search highlight
nnoremap <leader><space> :nohlsearch<CR> 

"toggle special paste mode
nnoremap <leader>p :set invpaste paste?<CR>
set pastetoggle=<leader>p
set showmode

"copy to system clipboard
vnoremap <leader>y "*y 

"tab navigation 
nnoremap <leader>tk :tabnext<CR>
nnoremap <leader>tj :tabprev<CR>
nnoremap <leader>tt :tabnew<CR>
nnoremap <leader>tq :bp <BAR> bd #<CR> tabclose<CR>
nnoremap <leader>tc :tabclose<CR>
" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

" :w!! 
" " write the file when you accidentally opened it without the right (root)
" privileges
cmap w!! w !sudo tee % > /dev/null"


"######## PLUGINS SETTINGS #########""

" Pathogen runtime
runtime bundle/vim-pathogen/autoload/pathogen.vim 
execute pathogen#infect()



" NERDTree shortcuts below
nnoremap <leader>E  :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Disable NERDTree unicode arrows (when lack of Unicode support)
"let g:NERDTreeDirArrows=0


" Vim-Airline
" list buffers across top (vim-airline)
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

"Silver Searcher (open ag.vim)
nnoremap <leader>a :Ag
let g:ag_working_path_mode="r"

" Ctrl-P settings
let g:ctrlp_match_window = 'botom,order:ttb,results:100' "overcome limits imposed by max height
let g:ctrlp_switch_buffer = 0
" use nearest .git (or similar) directory as the cwd
let g:ctrlp_working_path_mode = 'ra'
" use silver surfer for search (faster than default)
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
" setup some default ignores
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
  \}
" easy bindings for its various modes
nmap <leader>bb :CtrlPBuffer<cr>
nmap <leader>bm :CtrlPMixed<cr>
nmap <leader>bs :CtrlPMRU<cr>
nmap <leader>bl :CtrlPLine<cr>


"EasyMotion JK motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

"fugitive
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gb :Gblame<CR>


"######## FUNCTIONALITY SETTINGS #########""

" make backspace work properly
set backspace=indent,eol,start

" Visual
syntax enable
set cursorline
set number
set showcmd
set cmdheight=1
set numberwidth=5

"Color Schemes
" Zenburn
set t_Co=256
set background=dark
" colorscheme tomorrow-night-eighties
colorscheme zenburn

"Solarized
"let g:solarized_termcolors=256
"set background=dark
"colorscheme solarized

" search with /
set showmatch
set incsearch
set hlsearch

"set files to unix 
"forEach non-unix EOL, CR shows as ^M
set fileformats=unix

"set 2 character indentation and tabbing
filetype plugin indent on
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set showtabline=2
set autoindent
set smarttab

set laststatus=2
set ignorecase smartcase
set shell=bash
set switchbuf=useopen
"allow buffer to be hidden if you've modified it
set hidden
set mouse=a

set wildmenu "visual autocompete for command menu
set lazyredraw "redraw only when we need to
set showmatch " highlight matching [{()}]

"code folding
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=indent

" allow cursor change in tmux mode
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif


