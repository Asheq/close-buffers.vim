" close-buffers.vim
" Commands to delete buffers
" Author:	Asheq Imran <https://github.com/Asheq>
" License:	Same license as Vim itself
" Version: 0.4

" TODO
" --------------------
" - Make work flawlessly with terminal buffers
" - Use moll/vim-bbye to allow closing buffers without messing up layout. Use a 'preserve' flag.
" - Add 'set confirm' as recommended setting

" Setup
" --------------------
if exists("g:loaded_close_buffers")
  finish
endif
let g:loaded_close_buffers = 1

let s:save_cpo = &cpo
set cpo&vim

runtime Bdelete.vim
runtime obsolete-commands.vim

" Teardown
" --------------------
let &cpo = s:save_cpo
unlet s:save_cpo
