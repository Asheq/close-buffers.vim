" close-buffers.vim
" Commands to delete buffers
" Author:	Asheq Imran <https://github.com/Asheq>
" License:	Same license as Vim itself
" Version: 0.2

" TODO
" --------------------
" - Use moll/vim-bbye to allow closing buffers without messing up layout. Use a -preserve flag.
" - Use new command names. Bdelete, BdeleteMenu, BdeleteAll, etc. Show warning for old commands.

" Setup
" --------------------
if exists("g:loaded_close_buffers")
	finish
endif
let g:loaded_close_buffers = 1

let s:save_cpo = &cpo
set cpo&vim

let s:menu_option_letters = split('c a h n o s t')
let s:letter_to_confirm_option = {
			\ 'c'  : '&Cancel',
			\ 'a'  : '&All',
			\ 'h'  : '&Hidden',
			\ 'n'  : '&Nameless',
			\ 'o'  : '&Other',
			\ 's'  : '&Select',
			\ 't'  : '&This',
			\ }
let s:letter_to_function_name = {
			\ 'c'  : '',
			\ 'a'  : 'CloseAllBuffers',
			\ 'h'  : 'CloseHiddenBuffers',
			\ 'n'  : 'CloseNamelessBuffers',
			\ 'o'  : 'CloseOtherBuffers',
			\ 's'  : 'CloseSelectedBuffers',
			\ 't'  : 'CloseThisBuffer',
			\ }
let s:confirm_string = join(map(deepcopy(s:menu_option_letters), 's:letter_to_confirm_option[v:val]'), "\n")

" Commands
" --------------------
if !exists(':CloseAllBuffers')
	command -bang CloseAllBuffers call s:CloseAllBuffers(<bang>0)
endif

if !exists(':CloseOtherBuffers')
	command -bang CloseOtherBuffers call s:CloseOtherBuffers(<bang>0)
endif

if !exists(':CloseHiddenBuffers')
	command -bang CloseHiddenBuffers call s:CloseHiddenBuffers(<bang>0)
endif

if !exists(':CloseNamelessBuffers')
	command -bang CloseNamelessBuffers call s:CloseNamelessBuffers(<bang>0)
endif

if !exists(':CloseThisBuffer')
	command -bang CloseThisBuffer call s:CloseThisBuffer(<bang>0)
endif

if !exists(':CloseSelectedBuffers')
	command -bang CloseSelectedBuffers call s:CloseSelectedBuffers(<bang>0)
endif

if !exists(':CloseBuffers')
	command -bang CloseBuffers call s:CloseBuffersMenu(<bang>0)
endif

if !exists(':CloseBuffersMenu')
	command -bang CloseBuffersMenu call s:CloseBuffersMenu(<bang>0)
endif

" Functions
" --------------------
function! s:CloseAllBuffers(bang)
	let all_listed_buffers = filter(range(1, bufnr('$')), 'buflisted(v:val)')
	call s:DeleteBuffers(all_listed_buffers, a:bang)
endfunction

function! s:CloseOtherBuffers(bang)
	let all_listed_buffers = filter(range(1, bufnr('$')), 'buflisted(v:val)')
	let current_buffer = bufnr('%')
	let other_buffers = filter(all_listed_buffers, 'v:val != current_buffer')
	call s:DeleteBuffers(other_buffers, a:bang)
endfunction

function! s:CloseHiddenBuffers(bang)
	let hidden_buffers = map(filter(getbufinfo(), 'empty(v:val.windows)'), 'v:val.bufnr')
	call s:DeleteBuffers(hidden_buffers, a:bang)
endfunction

function! s:CloseNamelessBuffers(bang)
	let all_listed_buffers = filter(range(1, bufnr('$')), 'buflisted(v:val)')
	let nameless_buffers = filter(all_listed_buffers, 'bufname(v:val) == ""')
	call s:DeleteBuffers(nameless_buffers, a:bang)
endfunction

function! s:CloseThisBuffer(bang)
	execute s:GetBufferDeleteCommand(a:bang)
endfunction

function! s:CloseSelectedBuffers(bang)
  pwd
  ls
  call feedkeys(':' . s:GetBufferDeleteCommand(a:bang) . ' ')
endfunction

function! s:CloseBuffersMenu(bang)
	let choice = confirm("Delete Buffers?", s:confirm_string, 1)
	let function_name = s:letter_to_function_name[s:menu_option_letters[choice - 1]]
	if function_name != ''
		execute 'call s:' . function_name  . '('. a:bang . ')'
	endif
endfunction

" Helper functions
" --------------------
function! s:DeleteBuffers(buffer_numbers, bang)
  if !empty(a:buffer_numbers)
    execute s:GetBufferDeleteCommand(a:bang) . ' ' . join(a:buffer_numbers)
  endif
endfunction

function! s:GetBufferDeleteCommand(bang)
  return 'bdelete' . (a:bang ? '!' : '')
endfunction

" Teardown
" --------------------
let &cpo = s:save_cpo
unlet s:save_cpo
