" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2019 Jan 26
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings, bail
" out.
if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
augroup END

    " Add optional packages.
    "
    " The matchit plugin makes the % command work better, but it is not backwards
    " compatible.
    " The ! means the package won't be loaded right away but when plugins are
    " loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif

    " show line numbers on left margin
:set number

    " show existing tab with 4 spaces width
    " when indenting with '>', use 4 spaces width
    " On pressing tab, insert 4 spaces
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

    " auto turn off auto indent and turn back on when pasting from clipboard
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

    "set colorscheme
:colorscheme elflord

    "open terminal in split window
"set splitbelow
"autocmd VimEnter * terminal

    "Start NERDTree when opening vim and mover cursor to the window and 
"resize it ot 20 lines
"autocmd VimEnter * NERDTree | wincmd w | resize 20

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
    set pastetoggle=<Esc>[201~
    set paste
    return ""
endfunction
