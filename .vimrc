".vimrc file by Andre Dublin
"Forget compatibility with Vi. Who cares.
set nocompatible

set number "line numbers on
colorscheme railscasts3

"Write the old file out when switching between files.
set autowrite

"Display current cursor position in lower right corner.
set ruler

"Switch between buffers without saving
set hidden

"Always show the status line
set laststatus=2

"Nice tabbing
set tabstop=3
set softtabstop=3
set expandtab
set shiftwidth=3

"Set font type and size. Depends on the resolution. Larger screens, prefer h20
set guifont=Monaco:h14

"Indent Stuff
set smartindent
set autoindent

set spell
set showmode

"Searching
set cursorline "Highlight current line cursor is on
set showmatch "show matching brackets/parenthesis
set incsearch "Find as you type search
set ignorecase "case insensitive search
set smartcase "case sensitive when uc present
set hlsearch "Highlight searching

set winminheight=0 "Windows can be 0 line high

"Better line wrapping
set wrap
set textwidth=79
set formatoptions=qrnl

"Hard-wrap paragraphs of text
nnoremap <leader>q gqip

set mousehide "Hide mouse when typing

"Leader key settings
let mapleader= ',' "Want a different map leader than \
set timeoutlen=500

set showcmd "Show command in bottom right portion of the screen

"For autocompletion
set wildmenu "show list instead of completing
set wildmode=list:longest,full "command <Tab> completion, list matches, then longest common part, then all.
set list
set listchars=tab:?.,trail:.,extends:#,nbsp:. "Highlight problematic whitespace
set laststatus=2
set linespace=3 "Prefer a slightly higher line height

set go-=T "Hide MacVim toolbar by default

" Create dictionary for custom expansions
set dictionary+=/Users/andredublin/.vim/dict.txt

"Opens a vertical split and switches over (\v)
nnoremap <leader>v <C-w>v<C-w>l
set splitbelow "Split windows BELOW the current window!

" session settings
set sessionoptions=resize,winpos,winsize,buffers,tabpages,folds,curdir,help

"Enable filetypes
filetype on
filetype plugin on
filetype indent on
syntax on

set foldenable "auto fold code
"Shortcut to fold tags with leader (usually \) + ft
nnoremap <leader>ft Vatzf

"Set up an HTML5 template for all new .html files
autocmd BufNewFile * silent! Or $VIMHOME/templates/%:e.tpl

"Load the current buffer in Firefox 
abbrev ff :! open -a Firefox.app %:p<cr>
"Load the current buffer in Chrome
abbrev ch :! open -a Chrome.app %:p<cr>
"Load the current buffer in Safari
abbrev ss :! open -a Safari.app %:p<cr>
"Load the current buffer in Opera
abbrev op :! open -a Opera.app %:p<cr>

"Map directorys
nmap <leader>d :cd ~/Desktop<cr>:e.<cr>
nmap <leader>s :cd ~/Sites<cr>:e.<cr>
nmap <leader>r :cd ~/Sites/repo<cr>:e.<cr>
nmap <leader>h :cd ~/<cr>:e.<cr>

"Shortcut to my vimrc file
nmap <leader>ev :tabedit $MYVIMRC<cr>

"Shortcut for logging into my server
nmap <leader>server :Nread editme<cr>

"Change zen coding expand key to Ctrl + e
let g:user_zen_expandabbr_key = '<C-e>'

"Taglist
let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_WinWidth = 50
map <leader>tl :TlistToggle<cr>
map <leader>bt :!/usr/bin/ctags -R --ruby-kinds=+p --fields=+iaS --extra=+q .<cr>

"Saves time
nmap <space> :

"Automatcially change current directory to that of the file in the buffer
autocmd BufEnter * cd %:p:h

"Source the vimrc file after saving it
if has("autocmd")
	autocmd bufwritepost .vimrc source $MYVIMRC
endif

"Map code completion to , + tab
imap <leader><tab> <C-x><C-o>

"Faster shortcut for commenting. Requires T-Comment plugin
map <leader>c <c-_><c-_>

"Change working directory to that of the current file
cmap cwd lcd %:p:h
cmap cd. lcd %:p:h

"http://vim.wikia.com/wiki/Make_Vim_completion_popup_menu_work_just_like_in_an_IDE
set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

"Map escape key to jj -- much faster
imap jj <esc>

"Delete all buffers (via Derek Wyatt)
nmap <silent> ,da :exec "1," . bufnr('$') . "bd"<cr>

"Bubble single lines (kicks butt)
"http://vimcasts.org/episodes/bubbling-text/
nmap <C-Up> ddkP
nmap <C-Down> ddp
"Bubble multiple lines
vmap <C-Up> xkP`[V`]
vmap <C-Down> xp`[V`]

" easier window navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

"------------------------"
"NERDTREE PLUGIN SETTINGS
"------------------------"
"Shortcut for NERDTreeToggle
nmap <leader>nt :NERDTreeToggle <CR>

"NERDTree Settings
let NERDTreeShowHidden=1
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']

"autopen NERDTree and focus cursor in new document
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

"Helpeful abbreviations

iab lorem Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
iab llorem Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. 

"Spelling corrects. Just for example. Add yours below.
iab teh the
iab Teh The

" Alphabetically sort CSS properties in file with :SortCSS
:command! SortCSS :g#\({\n\)\@<=#.,/}/sort

" Shortcut to opening a virtual split to right of current pane
" Makes more sense than opening to the left
nmap <leader>bv :bel vsp

" Saves file when Vim window loses focus
au FocusLost * :wa

" Backups
set backupdir=~/.vim/tmp/backup// " backups
set directory=~/.vim/tmp/swap/ " swap files
set backup " enable backup

" No more stretching for navigating files
noremap h j
noremap j h
noremap k gj
noremap l gk
noremap ; l

set showmatch " show matching brackets

" print empty <a> tag
map! ;h <a href=""></a><ESC>5hi

au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery

autocmd BufNewFile,BufRead *.rb source ~/.vim/scripts/rubysnippets.vim
