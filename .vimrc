" Forget compatibility with Vi. Who cares.
set nocompatible

" ----------------------------------------------------------------------------
"  Save | Reload VIMRC
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
"  Golang Plugins
" ----------------------------------------------------------------------------
set runtimepath+=$GOROOT/misc/vim

" ----------------------------------------------------------------------------
" Windows Compatibility
"  ----------------------------------------------------------------------------
if has('win32') || has('win64')
    set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
endif

" ----------------------------------------------------------------------------
"  Misc
" ----------------------------------------------------------------------------
set timeoutlen=500
set backspace=indent,eol,start " Backspace for dummies
set modelines=0 " dont need modelines and the potential security hazard
fixdel
au FocusLost * :wa " Save when focus lost
au FocusLost * silent! wa " Ignore warnings from untitled buffers
set hidden " Switch between buffers without saving
set autowrite " Write the old file out when switching between files.
set autoread " Auto-reload buffers when file changed on disk
set updatecount=0 " Disable swap files
set sessionoptions=resize,winpos,winsize,buffers,tabpages,folds,curdir,help " Session settings
set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
set backupskip="/tmp/*,/private/tmp/*" " Make Vim able to edit crontab files
set clipboard=unnamed " Use the OS clipboard by default
set noshowmatch "Showmatch significantly slows down omnicomplete
set updatetime=500 " this setting controls how long to wait (in ms) before fetching type / symbol information.
set cmdheight=2 " Remove 'Press Enter to continue' message when type information is longer than one line.

" ----------------------------------------------------------------------------
"  Vundle
" ----------------------------------------------------------------------------
let g:vundle_default_git_proto = 'git'

" ----------------------------------------------------------------------------
"  NERDTree
" ----------------------------------------------------------------------------
nmap nt :NERDTreeToggle<CR>
" NERDTree Settings
let NERDTreeShowHidden=1
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.hg', '\.svn', '\.bzr', '\.git', '\.DS_Store', '\.class']
let NERDTreeChDirMode=2
let NERDTreeMouseMode=3
let NERDTreeQuitOnOpen=0
let NERDTreeKeepTreeInNewTab=1
" Autopen NERDTree and focus cursor in new document
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

" ----------------------------------------------------------------------------
"  JsBeautify
" ----------------------------------------------------------------------------
autocmd FileType javascript nnoremap <buffer> <leader>bf :call JsBeautify()<cr>
autocmd FileType html nnoremap <buffer> <leader>bf :call HtmlBeautify()<cr>
autocmd FileType css nnoremap <buffer> <leader>bf :call CSSBeautify()<cr>
" Visual mode
autocmd FileType javascript vnoremap <buffer> <leader>bf :call RangeJsBeautify()<cr>
autocmd FileType html vnoremap <buffer> <leader>bf :call RangeHtmlBeautify()<cr>
autocmd FileType css vnoremap <buffer> <leader>bf :call RangeCSSBeautify()<cr>

" ----------------------------------------------------------------------------
"  Vim-Javascript
" ----------------------------------------------------------------------------
let g:javascript_enable_domhtmlcss = 1

" ----------------------------------------------------------------------------
"  Syntastic
" ----------------------------------------------------------------------------
highlight SyntasticErrorSign guifg=white guibg=red
highlight SyntasticErrorLine guibg=#2f0000
let g:syntastic_check_on_open=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_auto_jump=1
let g:syntastic_auto_loc_list=1
let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'passive_filetypes': ['html'] }
let g:syntastic_stl_format='[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_html_checkers = ['tidy']
let g:syntastic_chef_checkers = ['foodcritic']
let g:syntastic_ruby_checkers = ['mri', 'rubylint']
let g:syntastic_go_checkers = ['go']
let g:syntastic_sass_checkers = ['sass']
let g:syntastic_php_checkers = ['php']

" ----------------------------------------------------------------------------
"  Tagbar
" ----------------------------------------------------------------------------
nnoremap <silent> <F9> :TagbarToggle<CR>
let g:tagbar_autofocus = 1
let g:tagbar_show_linenumbers = 2
let g:tagbar_singleclick = 1
let g:tagbar_ctags_bin='/usr/local/bin/ctags'
if filereadable(expand("$HOME/.vim/ctags.vim"))
    source $HOME/.vim/ctags.vim
endif

" ----------------------------------------------------------------------------
"  Emmet
" ----------------------------------------------------------------------------
let g:user_emmet_leader_key = '<C-e>' " Change emmet coding leader key to Ctrl + e
let g:use_emmet_complete_tag = 1

" ----------------------------------------------------------------------------
"  GitGutter
" ----------------------------------------------------------------------------
let g:gitgutter_enabled = 1
let g:gitgutter_on_bufenter = 0
let g:gitgutter_all_on_focusgained = 0

" ----------------------------------------------------------------------------
"  CtrlP
" ----------------------------------------------------------------------------
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_open_new_file = 't' " Open file in new tab

" ----------------------------------------------------------------------------
"  Vroom
" ----------------------------------------------------------------------------
let g:vroom_write_all = 1 " Write all tests before running
let g:vroom_use_bundle_exec = 1 " Run tests in tmux pane
let g:vroom_use_colors = 1 " ROYGBIV yall!

" ----------------------------------------------------------------------------
" Tabs
" ----------------------------------------------------------------------------
set ts=2 " Tabs Space
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set shiftwidth=2 " Indent blocks of text 4 spaces
set tabstop=2 " Indent blocks of text 4 spaces
set expandtab
set shiftround " Use multiple of shiftwidth when indenting with '<' and '>'
set softtabstop=2 " Makes the spaces feel like real tabs
set smarttab  " Insert tab on the start of a line according to shiftwidth

" ----------------------------------------------------------------------------
"  GUI
" ----------------------------------------------------------------------------
set showcmd " This shows what you are typing as a command.
set showmode
set virtualedit=onemore " Allow for cursor beyond last character
colorscheme desert " Set default theme
set guifont=Monaco:h10 " Set default font, font-size (mac)
set splitbelow
set splitright
set cursorline
set title " Change the terminals title
set noerrorbells " Don't beep
set visualbell " Don't beep
set showmatch "Show matching brackets/parenthesis
set mat=5 " Bracket blinking.
set tabpagemax=5 " Set the amount of tabs open at any given time.
syntax on " Syntax highlighting on
set magic " RegEx Do The Damn Thing
set number " Line numbers on
set ruler " Display current cursor position in lower right corner.
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
set winminheight=0 " Windows can be 0 line high
set mousehide " Hide mouse when typing 
set mouse=a " Automatically enable mouse usage
set go-=T " Hide MacVim toolbar by default
set linespace=3 " Prefer a slightly higher line height
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:. " Highlight problematic whitespace
set scrolljump=5 " Lines to scroll when cursor leaves screen
set scrolloff=3 " Minimum lines to keep above and below cursor
set sidescroll=5 " Minimum number of columns to scoll horizontally
set shell=bash " Avoids some problems with zsh
let g:is_bash=1 " Default shell syntax
" Jump to last cursor position when editing a file
" Don't do it when position is invalid or when inside an event handler
autocmd BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \   exe "normal g`\"" |
            \ endif
" Make terminal Vim work sanely
set notimeout
set ttimeout
set ttimeoutlen=100
set ttyfast
if $TERM == "xterm-256color" || $TERM == "screen-256color" || $COLORTERM == "gnome-terminal"
  set t_Co=256 " Set term color support
endif
set grepprg=ack " Use ACK for grepping
set grepformat=%f:%l:%m
set laststatus=2 " Status line

" ----------------------------------------------------------------------------
"  Search
" ----------------------------------------------------------------------------
set incsearch "Find as you type search
set ignorecase "Case insensitive search
set smartcase "Case sensitive when uc present
set hlsearch "Highlight searching
set spell
set gdefault " The /g flag on :s substitutions by default
" Wildmenu autocompletion
if has("wildmenu")
    set wildmenu
    set wildmode=list:longest,full
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*        " Linux/MacOSX
    set wildignore+=*\\.git\\*,*\\.hg\\*,*\\.svn\\*  " Windows ('noshellslash')
    set wildignore+=*.a,*.o
    set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png
    set wildignore+=*~,*.swp,*.tmp
    set wildignore+=vendor,log,gems,.bundle,Gemfile.lock,.gem,data\/mongodb
    set wildignore+=tmp/**,*.scssc,*.sassc
    set wildignore+=bundle/**,vendor/bundle/**,vendor/cache/**
    set wildignore+=node_modules/**
endif

" ----------------------------------------------------------------------------
"  History and Backups
" ----------------------------------------------------------------------------
set nobackup " Do not keep backups after close
set nowritebackup " Do not keep a backup while working
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp " Store swap files here
set noswapfile " Don't keep swp files either
set undolevels=100
set history=100
if has('persistent_undo')
    set undodir=~/.vim/undo
    set undofile
    set undoreload=100
endif

" ----------------------------------------------------------------------------
"  Formatting
" ----------------------------------------------------------------------------
" Indent Stuff
set smartindent
set autoindent
set copyindent
" Better line wrapping
set wrap
set formatoptions=qrnl
set formatoptions+=j " Delete comment char when joining commented lines
" Encoding
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set complete=.,w,b,u,],i,k " Read files from buffers, tag fields and dictionary for completion
au BufRead,BufNewFile {Gemfile,Rakefile,Thorfile,config.ru,Guardfile} set ft=ruby " Thorfile, Rakefile and Gemfile are Ruby
autocmd FileType text setlocal textwidth=78
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,txt} setf markdown " Markdown files
au BufRead,BufNewFile *.md setlocal spell " Enable spellchecking for Markdown
au BufRead,BufNewFile *.md setlocal textwidth=80 " Automatically wrap at 80 characters for Markdown
au BufRead,BufNewFile *.scss setf scss
au BufRead,BufNewFile jquery.*.js setf javascript syntax=jquery
au BufRead,BufNewFile *.json setf javascript " Treat JSON files like javascript
au BufRead,BufNewFile *.es6 setf javascript " Treat es6 files like javascript
let g:html_indent_tags = 'li\|p' " Treat <li> and <p> tags like the block tags they are
autocmd FileType c,cpp,java,php,js,python,twig,xml,yml autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))

" ----------------------------------------------------------------------------
"  Folding
" ----------------------------------------------------------------------------
if has('folding')
    set foldmethod=indent
    set nofoldenable
    set foldcolumn=1
    set foldlevel=1
    set foldnestmax=10
    set foldlevelstart=99
    set foldtext=strpart(getline(v:foldstart),0,50).'\ ...\ '.substitute(getline(v:foldend),'^[\ #]*','','g').'\ '
    " Shortcut to fold tags with leader (usually \) + ft
    nnoremap <leader>ft Vatzf
    highlight Folded guibg=grey guifg=blue
    highlight FoldColumn guibg=darkgrey guifg=white
endif

" ----------------------------------------------------------------------------
"  Conveniences
" ----------------------------------------------------------------------------
let mapleader="," " Reassign map leader key
" Opens a vertical split and switches over (\v)
nnoremap <leader>v <C-w>v<C-w>l
" Shortcut to my vimrc file
nmap <leader>ev :tabedit $MYVIMRC<cr>
" Map directorys
nmap <leader>d :cd ~/Desktop<cr>:e.<cr>
nmap <leader>s :cd ~/Sites<cr>:e.<cr>
nmap <leader>h :cd ~/<cr>:e.<cr>
nmap <leader>r :cd /<cr>:e.<cr>
" Saves time
nmap <space> :
" Automatically change current directory to that of the file in the buffer
autocmd BufEnter * cd %:p:h
" Change working directory to that of the current file
cmap cwd lcd %:p:h
cmap cd. lcd %:p:h
" Map escape key to jj -- much faster
imap jj <esc>
" Delete all buffers
nmap <silent> ,da :exec "1," . bufnr('$') . "bd"<cr>
" easier window navigation
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>
" No more stretching for navigating files
noremap h j
noremap j h
noremap k gj
noremap l gk
noremap ; l
" Make regexp search not suck by default
nnoremap / /\v
vnoremap / /\v
" Allow saving a sudo file if forgot to open as sudo
cmap w!! w !sudo tee % >/dev/null
