" ---------------------------------------------
"  Vundle Settings
"  --------------------------------------------
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
set rtp+=/usr/local/Cellar/go/1.3/libexec/misc/vim
call vundle#rc()

" Let Vundle manage Vundle
Bundle 'gmarik/vundle'

" Languages
Bundle 'tpope/vim-rails.git'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-cucumber'
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rake'
Bundle 'digitaltoad/vim-jade'
Bundle 'pangloss/vim-javascript'
Bundle 'kchmck/vim-coffee-script'
Bundle 'klen/python-mode'
Bundle 'faith/vim-go'

" Navigation
Bundle 'scrooloose/nerdtree'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'kien/ctrlp.vim'
Bundle 'majutsushi/tagbar'

" Colors
Bundle 'vim-scripts/CycleColor'
Bundle 'flazz/vim-colorschemes'

" UI
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/syntastic'
Bundle 'MatchTag'
Bundle 'AutoTag'
Bundle 'AutoClose'
Bundle 'Valloric/YouCompleteMe'
Bundle 'mattn/emmet-vim'
Bundle 'bling/vim-airline'

" Utilities
Bundle 'airblade/vim-gitgutter'
Bundle 'mattn/gist-vim'
Bundle 'mileszs/ack.vim'
Bundle 'tpope/vim-rbenv'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-dispatch'
Bundle 'skalnik/vim-vroom'
Bundle 'godlygeek/tabular'
Bundle 'mattn/webapi-vim'

filetype plugin indent on
