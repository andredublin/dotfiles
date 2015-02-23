" ---------------------------------------------
"  Vundle Settings
"  --------------------------------------------
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle
Plugin 'gmarik/Vundle.vim'

" Languages
Plugin 'tpope/vim-rails.git'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-cucumber'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rake'
Plugin 'digitaltoad/vim-jade'
Plugin 'pangloss/vim-javascript'
Plugin 'kchmck/vim-coffee-script'
Plugin 'klen/python-mode'
Plugin 'faith/vim-go'
Plugin 'jdonaldson/vaxe'

" Navigation
Plugin 'scrooloose/nerdtree'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'

" Colors
Plugin 'vim-scripts/CycleColor'
Plugin 'flazz/vim-colorschemes'

" UI
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'MatchTag'
Plugin 'AutoTag'
Plugin 'AutoClose'
Plugin 'Valloric/YouCompleteMe'
Plugin 'mattn/emmet-vim'
Plugin 'bling/vim-airline'

" Utilities
Plugin 'airblade/vim-gitgutter'
Plugin 'mattn/gist-vim'
Plugin 'mileszs/ack.vim'
Plugin 'tpope/vim-rbenv'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-dispatch'
Plugin 'skalnik/vim-vroom'
Plugin 'godlygeek/tabular'
Plugin 'mattn/webapi-vim'

call vundle#end()
filetype plugin indent on
