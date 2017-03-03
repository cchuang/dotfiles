"0 An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2006 Nov 16
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" if has("vms")
"   set nobackup		" do not keep a backup file, use versions instead
" else
"   set backup		" keep a backup file
" endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set langmenu=none

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" In many terminal emulators the mouse works just fine, thus enable it.
set mouse=a

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
	 	\ | wincmd p | diffthis

set tabstop=4
set shiftwidth=4
" filetype indent on

set fileencodings=utf-8,taiwan,chinese,usc-bom,iso8859-1
set fileencoding=utf-8

" let g:miniBufExplMapWindowNavVim = 1
" let g:miniBufExplMapWindowNavArrows = 1
" let g:miniBufExplMapCTabSwitchBufs = 1
" let g:miniBufExplModSelTarget = 1 

vnoremap <C-C> "+y

let tlist_r_settings = 'Splus;r:Regexp'

"" execute pathogen#infect()
"
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

"dein Scripts-----------------------------                                                                                                        [5/28]
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=$HOME/.vim/bundles/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state("$HOME/.vim/bundles")
  call dein#begin("$HOME/.vim/bundles")

  " Let dein manage dein
  " Required:
  call dein#add("$HOME/.vim/bundles/repos/github.com/Shougo/dein.vim")

  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('Shougo/unite.vim')
  call dein#add('Shougo/neomru.vim')

  " You can specify revision/branch/tag.
  call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------


" Unite
let g:unite_source_history_yank_enable = 1
call unite#filters#matcher_default#use(['matcher_fuzzy'])
nnoremap <leader>t :<C-u>Unite -no-split -ignorecase -buffer-name=files   -start-insert file_rec/async:!<cr>
nnoremap <leader>f :<C-u>Unite -no-split -ignorecase -buffer-name=files   -start-insert file<cr>
nnoremap <leader>r :<C-u>Unite -no-split -ignorecase -buffer-name=mru     -start-insert file_mru<cr>
nnoremap <leader>o :<C-u>Unite -no-split -ignorecase -buffer-name=outline -start-insert outline<cr>
nnoremap <leader>y :<C-u>Unite -no-split -ignorecase -buffer-name=yank history/yank<cr>
nnoremap <leader>e :<C-u>Unite -no-split -ignorecase -buffer-name=buffer  buffer<cr>

" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings() 
	" Play nice with supertab 
	let b:SuperTabDisabled=1 
	" Enable navigation with control-j and control-k in insert mode 
	imap <buffer> <C-j>   <Plug>(unite_select_next_line) 
	imap <buffer> <C-k>   <Plug>(unite_select_previous_line) 
endfunction

