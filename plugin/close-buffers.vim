" close-buffers.vim
" Commands to close buffers
" Author:	Asheq Imran <https://github.com/Asheq>
" License:	Same license as Vim itself
" Version: 0.2

" TODO:
" - Use moll/vim-bbye to allow closing buffers without messing up layout. Use a -preserve option.
" - Use new command names. Bdelete, BdeleteMenu, BdeleteAll, etc. Show warning for old names for 2 months.

if exists("g:loaded_close_buffers")
    finish
endif
let g:loaded_close_buffers = 1

let s:save_cpo = &cpo
set cpo&vim

let s:close_buffers_menu_options = 'c o h n s a t'
let s:menu_option_letters = split(s:close_buffers_menu_options)

" Define commands
if !exists(':CloseBuffersMenu')
    command -bang CloseBuffersMenu call s:CloseBuffersMenu(<bang>0)
endif

if !exists(':CloseBuffers')
    command -bang CloseBuffers call s:CloseBuffersMenu(<bang>0)
endif

if !exists(':CloseAllBuffers')
    command -bang CloseAllBuffers call s:CloseAllBuffers(<bang>0)
endif

if !exists(':CloseThisBuffer')
    command -bang CloseThisBuffer call s:CloseThisBuffer(<bang>0)
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

if !exists(':CloseSelectedBuffers')
    command -bang CloseSelectedBuffers call s:CloseSelectedBuffers(<bang>0)
endif

" Create helper variables
let s:letter_to_confirm_option = {
    \ 'c'  : '&Cancel',
    \ 'a'  : '&All',
    \ 't'  : '&This',
    \ 'o'  : '&Other',
    \ 'h'  : '&Hidden',
    \ 'n'  : '&Nameless',
    \ 's'  : '&Select',
    \ }
let s:letter_to_function_name = {
    \ 'c'  : '',
    \ 'a'  : 'CloseAllBuffers',
    \ 't'  : 'CloseThisBuffer',
    \ 'o'  : 'CloseOtherBuffers',
    \ 'h'  : 'CloseHiddenBuffers',
    \ 'n'  : 'CloseNamelessBuffers',
    \ 's'  : 'CloseSelectedBuffers',
    \ }
let s:confirm_string = join(map(deepcopy(s:menu_option_letters), 's:letter_to_confirm_option[v:val]'), "\n")

" Define implementing functions
function! s:CloseBuffersMenu(bang)
    let choice = confirm("Close Buffers?", s:confirm_string, 1)
    let function_name = s:letter_to_function_name[s:menu_option_letters[choice - 1]]
    if function_name != ''
        execute 'call s:' . function_name  . '('. a:bang . ')'
    endif
endfunction

function! s:CloseThisBuffer(bang)
    execute 'confirm bdelete' . (a:bang ? '!' : '')
endfunction

function! s:CloseAllBuffers(bang)
    let all_buffers = range(1, bufnr('$'))
    let deleted_count = s:DeleteBuffers(all_buffers, a:bang)
    call s:PrintSuccessMessage('All', deleted_count)
endfunction

function! s:CloseOtherBuffers(bang)
    let all_buffers = range(1, bufnr('$'))
    let current_buffer = bufnr('%')
    let other_buffers = filter(all_buffers, 'v:val != current_buffer')
    let deleted_count = s:DeleteBuffers(other_buffers, a:bang)
    call s:PrintSuccessMessage('Other', deleted_count)
endfunction

function! s:CloseHiddenBuffers(bang)
    let hidden_buffers = map(filter(getbufinfo(), 'empty(v:val.windows)'), 'v:val.bufnr')
    let deleted_count = s:DeleteBuffers(hidden_buffers, a:bang)
    call s:PrintSuccessMessage('Hidden', deleted_count)
endfunction

function! s:CloseSelectedBuffers(bang)
    call s:PrettyPrintBufferList()
    let input_text = input('Type space-seperated buffer numbers and <Enter>: ')
    let selected_buffers = map(split(input_text), 'str2nr(v:val)')
    let deleted_count = s:DeleteBuffers(selected_buffers, a:bang)
    call s:PrintSuccessMessage('Selected', deleted_count)
endfunction

function! s:CloseNamelessBuffers(bang)
    let all_buffers = range(1, bufnr('$'))
    let nameless_buffers = filter(all_buffers, 'bufname(v:val) == ""')
    let deleted_count = s:DeleteBuffers(nameless_buffers, a:bang)
    call s:PrintSuccessMessage('Nameless', deleted_count)
endfunction

" Auxiliary functions
function! s:DeleteBuffers(buffer_numbers, bang)
    let deleted_count = 0
    for buffer_number in a:buffer_numbers
        if buflisted(buffer_number)
            try
                execute 'confirm bdelete' . (a:bang ? '! ' : ' ') . buffer_number
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
    call s:EchoWithHighlightColor('--- Working Directory ---', 'Title')
    call s:EchoWithHighlightColor('    ' . fnamemodify(getcwd(), ':~') . "\n\n", 'Normal')
    call s:EchoWithHighlightColor('--- Buffers ---', 'Title')
    ls
    echo "\n"
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
