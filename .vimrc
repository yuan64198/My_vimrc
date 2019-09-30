filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
call vundle#end()
filetype plugin indent on

let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'

syntax on
set guifont=Monaco:h13
set nu
set cursorline
set shiftwidth =4
set ai
set tabstop =4
set expandtab
map <F5> :Autopep8<CR> :w<CR> :call RunPython()<CR>
function RunPython()
	let mp = &makeprg
	let ef = &errorformat
	let exeFile = expand("%:t")
	setlocal makeprg=python\ -u
	set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
	silent make %
	copen
	let &makeprg = mp
	let &errorformat = ef
endfunction
