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
au FocusLost * :wa " Save when focus lost
au FocusLost * silent! wa " Ignore warnings from untitled buffers
set hidden " Switch between buffers without saving
set autowrite " Write the old file out when switching between files.
set ttyfast
set sessionoptions=resize,winpos,winsize,buffers,tabpages,folds,curdir,help " Session settings
set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility

" ----------------------------------------------------------------------------
"  Status Line
" ----------------------------------------------------------------------------
set laststatus=2 " Enable status line
set statusline=%t\ %y\ format:\ %{&ff};\ [%c,%l]
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" ----------------------------------------------------------------------------
"  NERDTree
" ----------------------------------------------------------------------------
map <leader>d :execute 'NERDTreeToggle' . getcwd()<CR>      " Shortcut for NERDTreeToggle
" NERDTree Settings
let NERDTreeShowHidden=1
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.hg', '\.svn', '\.bzr', '\.git', '\.DS_Store']
let NERDTreeChDirMode=0
let NERDTreeMouseMode=3
let NERDTreeQuitOnOpen=1
let NERDTreeKeepTreeInNewTab=1
" Autopen NERDTree and focus cursor in new document
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

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
let g:syntastic_mode_map = { 'mode': 'active' }
let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'

" ----------------------------------------------------------------------------
"  Tagbar
" ----------------------------------------------------------------------------
nnoremap <silent> <F9> :TagbarToggle<CR>
let g:tagbar_autofocus = 1
let g:tagbar_ctags_bin='/usr/local/bin/ctags'
let g:tagbar_type_markdown = {
    \ 'ctagstype' : 'markdown',
    \ 'kinds' : [
        \ 'h:Heading_L1',
        \ 'i:Heading_L2',
        \ 'k:Heading_L3'
    \ ]
\ }
let g:tagbar_type_puppet = {
    \ 'ctagstype': 'puppet',
    \ 'kinds': [
        \'c:class',
        \'s:site',
        \'n:nodn',
        \'d:definition'
    \ ]
\ }
let g:tagbar_type_ruby = {
    \ 'kinds' : [
        \ 'm:modules',
        \ 'c:classes',
        \ 'd:describes',
        \ 'C:contexts',
        \ 'f:methods',
        \ 'F:singleton methods'
    \ ]
\ }

" ----------------------------------------------------------------------------
"  Zencoding
" ----------------------------------------------------------------------------
let g:user_zen_expandabbr_key = '<C-e>' " Change zen coding leader key to Ctrl + e

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
" Tabs
" ----------------------------------------------------------------------------
set ts=4 " Tabs Space
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set shiftwidth=4 " Indent blocks of text 4 spaces
set tabstop=4 " Indent blocks of text 4 spaces
set expandtab
set softtabstop=4 " Makes the spaces feel like real tabs

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
set number " Uine numbers on
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
" Jump to last cursor position when editing a file
" Don't do it when position is invalid or when inside an event handler
autocmd BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \   exe "normal g`\"" |
            \ endif

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
    set wildignore+=*.a,*.o
    set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png
    set wildignore+=.DS_Store,.git,.hg,.svn
    set wildignore+=*~,*.swp,*.tmp
    set wildignore+=vendor,log,gems,.bundle,Gemfile.lock,.gem,data\/mongodb
endif

" ----------------------------------------------------------------------------
"  History and Backups
" ----------------------------------------------------------------------------
set nobackup " Do not keep backups after close
set nowritebackup " Do not keep a backup while working
set noswapfile " Don't keep swp files either
set undolevels=1000
set history=1000
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
" Encoding
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set complete=.,w,b,u,],i,k " Read files from buffers, tag fields and dictionary for completion
au BufRead,BufNewFile {Gemfile,Rakefile,Thorfile,config.ru,Guardfile} set ft=ruby " Thorfile, Rakefile and Gemfile are Ruby
autocmd FileType text setlocal textwidth=78
au BufRead,BufNewFile *.md set filetype=markdown " Markdown files end in .md
au BufRead,BufNewFile *.md setlocal spell " Enable spellchecking for Markdown
au BufRead,BufNewFile *.md setlocal textwidth=80 " Automatically wrap at 80 characters for Markdown
au BufRead,BufNewFile *.scss set filetype=scss
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery
let g:html_indent_tags = 'li\|p' " Treat <li> and <p> tags like the block tags they are
autocmd FileType c,cpp,java,php,js,python,twig,xml,yml autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))

" ----------------------------------------------------------------------------
"  Folding
" ----------------------------------------------------------------------------
if has('folding')
    set foldmethod=indent
    set foldenable
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
" Walking through windows and make them full screen at the same time
map <Up> <c-w>k<c-w>_<c-w><Bar>
map <Down> <c-w>j<c-w>_<c-w><Bar>
map <Left> <c-w>h<c-w>_<c-w><Bar>
map <Right> <c-w>l<c-w>_<c-w><Bar>
" Shortcut to my vimrc file
nmap <leader>ev :tabedit $MYVIMRC<cr>
" Map directorys
nmap <leader>d :cd ~/Desktop<cr>:e.<cr>
nmap <leader>s :cd ~/Sites<cr>:e.<cr>
nmap <leader>h :cd ~/<cr>:e.<cr>
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
