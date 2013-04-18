" Forget compatibility with Vi. Who cares.
set nocompatible

" ----------------------------------------------------------------------------
"  Save | Reload VIM
" ----------------------------------------------------------------------------
if has("autocmd")
    autocmd bufwritepost .vimrc source $MYVIMRC
endif

" ----------------------------------------------------------------------------
" Load Plugins via Vundle
"  ----------------------------------------------------------------------------
if filereadable(expand("$HOME/.vim/vundle_bundle.vim"))
    source $HOME/.vim/vundle_bundle.vim
endif

" ----------------------------------------------------------------------------
"  Misc
" ----------------------------------------------------------------------------
" This shows what you are typing as a command.
set showcmd
set showmode
set timeoutlen=500
" Save when focus lost
au FocusLost * :wa
" Ignore warnings from untitled buffers
au FocusLost * silent! wa
" Switch between buffers without saving
set hidden
" Write the old file out when switching between files.
set autowrite
set autoread
set ttyfast

" ----------------------------------------------------------------------------
"  Status Line
" ----------------------------------------------------------------------------
" enable status line
set laststatus=2
set statusline=%t\ %y\ format:\ %{&ff};\ [%c,%l]

" ----------------------------------------------------------------------------
"  NERDTree
" ----------------------------------------------------------------------------
" Shortcut for NERDTreeToggle
nmap <leader>nt :NERDTreeToggle <CR>
" NERDTree Settings
let NERDTreeShowHidden=1
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.hg', '\.svn', '\.bzr','\.DS_Store']
let NERDTreeChDirMode=1
" autopen NERDTree and focus cursor in new document
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
" Map directorys
nmap <leader>d :cd ~/Desktop<cr>:e.<cr>
nmap <leader>s :cd ~/Sites<cr>:e.<cr>
nmap <leader>h :cd ~/<cr>:e.<cr>

" ----------------------------------------------------------------------------
"  Syntastic
" ----------------------------------------------------------------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
highlight SyntasticErrorSign guifg=white guibg=red
highlight SyntasticErrorLine guibg=#2f0000
let g:syntastic_check_on_open=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_auto_jump=1
let g:syntastic_auto_loc_list=1
let g:syntastic_mode_map = { 'mode': 'active' }
let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'

" ----------------------------------------------------------------------------
"  Tagbar
" ----------------------------------------------------------------------------
nnoremap <silent> <F9> :TagbarToggle<CR>
let g:tagbar_autofocus = 1
let g:tagbar_ctags_bin='/usr/local/bin/ctags'

" ----------------------------------------------------------------------------
"  Zencoding
" ----------------------------------------------------------------------------
" Change zen coding leader key to Ctrl + e
let g:user_zen_expandabbr_key = '<C-e>'

" ----------------------------------------------------------------------------
"  GitGutter
" ----------------------------------------------------------------------------
let g:gitgutter_enabled = 1
let g:gitgutter_on_bufenter = 0
let g:gitgutter_all_on_focusgained = 0
let g:gitgutter_all_on_focusgained = 0

" ----------------------------------------------------------------------------
"  CtrlP
" ----------------------------------------------------------------------------
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" ----------------------------------------------------------------------------
"  Backups
" ----------------------------------------------------------------------------
" do not keep backups after close
set nobackup
" do not keep a backup while working
set nowritebackup
" don't keep swp files either
set noswapfile

" ----------------------------------------------------------------------------
" Tabs
" ----------------------------------------------------------------------------
"Tabs Space
set ts=4
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
"indent blocks of text 4 spaces
set shiftwidth=4
"indent blocks of text 4 spaces
set tabstop=4
set expandtab

" ----------------------------------------------------------------------------
"  GUI
" ----------------------------------------------------------------------------
" set default theme
colorscheme desert
" set default font, font-size (mac)
set guifont=Monaco:h10
set splitbelow
set splitright
set cursorline
" highlight current line
set cul
" Show matching brackets.
set showmatch
" Bracket blinking.
set mat=5
" Set the amount of tabs open at any given time.
set tabpagemax=5
" Syntax highlighting on
syntax on
" RegEx Do The Damn Thing
set magic
" line numbers on
set number
" Display current cursor position in lower right corner.
set ruler
" Windows can be 0 line high
set winminheight=0
" Hide mouse when typing
set mousehide 
" Hide MacVim toolbar by default
set go-=T
" Prefer a slightly higher line height
set linespace=3 
set nolist

" ----------------------------------------------------------------------------
"  Search
" ----------------------------------------------------------------------------
set cursorline "Highlight current line cursor is on
set showmatch "show matching brackets/parenthesis
set incsearch "Find as you type search
set ignorecase "case insensitive search
set smartcase "case sensitive when uc present
set hlsearch "Highlight searching
set spell
set spelllang=en_us
set gdefault
" Wildmenu autocompletion
if has("wildmenu")
    set wildmenu
    set wildmode=list:longest,full
    set wildignore+=*.a,*.o
    set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png
    set wildignore+=.DS_Store,.git,.hg,.svn
    set wildignore+=*~,*.swp,*.tmp
    set wildignore+=vendor,log,gems,.bundle,Gemfile.lock,.gem,data\/mongodb
endif

" ----------------------------------------------------------------------------
"  History
" ----------------------------------------------------------------------------
set undolevels=10000
if has('persistent_undo')
    set undodir=~/.vim/undo
    set undofile
    set undoreload=10000
endif

" ----------------------------------------------------------------------------
"  Formatting
" ----------------------------------------------------------------------------
" Indent Stuff
set smartindent
set autoindent
" Better line wrapping
set wrap
set formatoptions=qrnl
set dictionary=en
" Encoding
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
" Read files from buffers, tag fields and dictionary for completion
set complete=.,w,b,u,],i,k
" Thorfile, Rakefile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Thorfile,config.ru,Guardfile} set ft=ruby
autocmd FileType ruby,haml,eruby,yaml,html,sass,cucumber set ai sw=2 sts=2 et
autocmd FileType javascript set sw=2 sts=2 et
au BufRead,BufNewFile *.scss set filetype=scss
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery

" ----------------------------------------------------------------------------
"  Folding
" ----------------------------------------------------------------------------
if has('folding')
    set foldenable
    set foldcolumn=1
    set foldlevel=1
    set foldnestmax=2
    set foldtext=strpart(getline(v:foldstart),0,50).'\ ...\ '.substitute(getline(v:foldend),'^[\ #]*','','g').'\ '
    "Shortcut to fold tags with leader (usually \) + ft
    nnoremap <leader>ft Vatzf
    highlight Folded guibg=grey guifg=blue
    highlight FoldColumn guibg=darkgrey guifg=white
endif

" ----------------------------------------------------------------------------
"  Conveniences
" ----------------------------------------------------------------------------
" Reassign map leader key
let mapleader=","
" Opens a vertical split and switches over (\v)
nnoremap <leader>v <C-w>v<C-w>l
" Walking through windows and make them full screen at the same time
map <Up> <c-w>k<c-w>_<c-w><Bar>
map <Down> <c-w>j<c-w>_<c-w><Bar>
map <Left> <c-w>h<c-w>_<c-w><Bar>
map <Right> <c-w>l<c-w>_<c-w><Bar>
" Session settings
set sessionoptions=resize,winpos,winsize,buffers,tabpages,folds,curdir,help
" Shortcut to my vimrc file
nmap <leader>ev :tabedit $MYVIMRC<cr>
" Saves time
nmap <space> :
" Automatcially change current directory to that of the file in the buffer
autocmd BufEnter * cd %:p:h
" Change working directory to that of the current file
cmap cwd lcd %:p:h
cmap cd. lcd %:p:h
" Map escape key to jj -- much faster
imap jj <esc>
" Delete all buffers
nmap <silent> ,da :exec "1," . bufnr('$') . "bd"<cr>
" easier window navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
" Shortcut to opening a virtual split to right of current pane
" Makes more sense than opening to the left
nmap <leader>bv :bel vsp
" No more stretching for navigating files
noremap h j
noremap j h
noremap k gj
noremap l gk
noremap ; l
