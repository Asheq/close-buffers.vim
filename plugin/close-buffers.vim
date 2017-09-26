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

function! s:CloseBuffers()
    call s:PrettyPrintBufferList()
    call s:EchoWithHighlightColor("Close Buffers?", 'Question')
    call s:EchoWithHighlightColor('[C]ancel, (T)his, (A)ll, (O)ther, (H)idden, (S)elect, (N)ameless: ', 'Question')
    let answer = tolower(nr2char(getchar()))
    if answer == 't'
        call s:CloseThisBuffer()
    elseif answer == 'a'
        call s:CloseAllBuffers()
    elseif answer == 'o'
        call s:CloseOtherBuffers()
    elseif answer == 'h'
        call s:CloseHiddenBuffers()
    elseif answer == 's'
        call s:CloseSelectedBuffers()
    elseif answer == 'n'
        call s:CloseNamelessBuffers()
    else
        redraw
    endif
endfunction

function! s:CloseThisBuffer()
    confirm bdelete
    redraw
endfunction

function! s:CloseAllBuffers()
    let buffer_numbers = range(1, bufnr('$'))
    let deleted_count = s:DeleteBuffers(buffer_numbers)
    call s:PrintSuccessMessage('All', deleted_count)
endfunction

function! s:CloseOtherBuffers()
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
    call s:PrintSuccessMessage('Other', deleted_count)
endfunction

function! s:CloseHiddenBuffers()
    let max_buffer_number = bufnr('$')
    let buffer_numbers = []
    let i = 1
    while i <= max_buffer_number
        if bufwinid(i) == -1
            let buffer_numbers = add(buffer_numbers, i)
        endif
        let i += 1
    endwhile
    let deleted_count = s:DeleteBuffers(buffer_numbers)
    call s:PrintSuccessMessage('Hidden', deleted_count)
endfunction

function! s:CloseSelectedBuffers()
    let buffer_numbers = input('Type space-seperated buffer numbers and <Enter>: ')
    let deleted_count = s:DeleteBuffers(map(split(buffer_numbers), 'str2nr(v:val)'))
    call s:PrintSuccessMessage('Selected', deleted_count)
endfunction

function! s:CloseNamelessBuffers()
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
    call s:PrintSuccessMessage('Nameless', deleted_count)
endfunction

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

function! s:PrettyPrintBufferList()
    call s:EchoWithHighlightColor('--- Buffer List ---', 'Title')
    ls
endfunction

function! s:PrintSuccessMessage(buffer_type, deleted_count)
    redraw
    call s:EchoWithHighlightColor(a:buffer_type . ' buffers deleted (' . a:deleted_count . ')' , 'WarningMsg')
endfunction

function! s:EchoWithHighlightColor(msg, highlight_group)
    execute "echohl " . a:highlight_group
    execute "echo '" . a:msg . "'"
    execute "echohl Normal"
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
