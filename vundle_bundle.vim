" ---------------------------------------------
"  Vundle Settings
"  --------------------------------------------
set nocompatible 
filetype off 

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'Lokaltog/vim-easymotion'
Bundle 'mattn/zencoding-vim'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-rails.git'
Bundle 'tpope/vim-rbenv'
Bundle 'vim-ruby/vim-ruby'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/syntastic'
Bundle 'majutsushi/tagbar'
Bundle 'MatchTag'
Bundle 'AutoTag'
Bundle 'AutoClose'
Bundle 'Valloric/YouCompleteMe'
Bundle 'vim-scripts/CycleColor'
Bundle 'mileszs/ack.vim'
Bundle 'airblade/vim-gitgutter'
Bundle 'flazz/vim-colorschemes'
Bundle 'digitaltoad/vim-jade'
Bundle 'kien/ctrlp.vim'

filetype plugin indent on
