" close-buffers.vim
" :CloseBuffers displays an interactive dialog to close buffers
" Author:	Asheq Imran <https://github.com/Asheq>
" License:	Same license as Vim itself

if exists("g:loaded_close_buffers")
  finish
endif
let g:loaded_close_buffers = 1

let s:save_cpo = &cpo
set cpo&vim

if !exists(':CloseBuffers')
  command CloseBuffers call s:CloseBuffers()
endif

function! s:DeleteBuffers(buffer_numbers)
  let deleted_count = 0
  for buffer_number in a:buffer_numbers
    if buflisted(buffer_number)
      try
        execute 'confirm bdelete ' . buffer_number
      catch
      endtry
      if !buflisted(buffer_number)
        let deleted_count += 1
      endif
    endif
  endfor
  return deleted_count
endfunction

function! s:CloseBuffers()
  call s:PrettyPrintBufferList()
  call s:EchoWithHighlightColor('Close Buffers?', 'Question')
  call s:EchoWithHighlightColor('[C]ancel, (T)his, (A)ll, (O)ther, (S)elect, (N)ameless: ', 'Question')
  let answer = nr2char(getchar())
  if tolower(answer) == 't'
    confirm bdelete
    redraw
  elseif tolower(answer) == 'a'
    let buffer_numbers = range(1, bufnr('$'))
    let deleted_count = s:DeleteBuffers(buffer_numbers)
    redraw
    call s:EchoWithHighlightColor('All buffers deleted (' . deleted_count . ')' , 'WarningMsg')
  elseif tolower(answer) == 'o'
    let current_buffer_number = bufnr('%')
    let max_buffer_number = bufnr('$')
    let buffer_numbers = []
    let i = 1
    while i <= max_buffer_number
      if i != current_buffer_number
        let buffer_numbers = add(buffer_numbers, i)
      endif
      let i += 1
    endwhile
    let deleted_count = s:DeleteBuffers(buffer_numbers)
    redraw
    call s:EchoWithHighlightColor('Other buffers deleted (' . deleted_count . ')', 'WarningMsg')
  elseif tolower(answer) == 's'
    let buffer_numbers = input('Type space-seperated buffer numbers and <Enter>: ')
    let deleted_count = s:DeleteBuffers(map(split(buffer_numbers), 'str2nr(v:val)'))
    redraw
    call s:EchoWithHighlightColor('Selected buffers deleted (' . deleted_count . ')', 'WarningMsg')
  elseif tolower(answer) == 'n'
    let max_buffer_number = bufnr('$')
    let buffer_numbers = []
    let i = 1
    while i <= max_buffer_number
      if bufname(i) == ''
        let buffer_numbers = add(buffer_numbers, i)
      endif
      let i += 1
    endwhile
    let deleted_count = s:DeleteBuffers(buffer_numbers)
    redraw
    call s:EchoWithHighlightColor('Nameless buffers deleted (' . deleted_count . ')', 'WarningMsg')
  else
    redraw
  endif
endfunction

" Auxiliary functions
" ======================================================================

function! s:PrettyPrintBufferList()
  call s:EchoWithHighlightColor('--- Buffer List ---', 'Title')
  ls
endfunction

function! s:EchoWithHighlightColor(msg, highlight_group)
  execute "echohl " . a:highlight_group
  execute "echo '" . a:msg . "'"
  execute "echohl Normal"
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
