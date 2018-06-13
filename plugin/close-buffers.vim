" close-buffers.vim
" Commands to close buffers
" Author:	Asheq Imran <https://github.com/Asheq>
" License:	Same license as Vim itself
" Version: 0.2

" TODO:
" - Allow ! to be added to the end of any command to force close the buffers without confirms
" - Use moll/vim-bbye to allow closing buffers without messing up layout

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
    command CloseBuffersMenu call s:CloseBuffersMenu()
endif

if !exists(':CloseBuffers')
    command CloseBuffers call s:CloseBuffersMenu()
endif

if !exists(':CloseAllBuffers')
    command CloseAllBuffers call s:CloseAllBuffers()
endif

if !exists(':CloseThisBuffer')
    command CloseThisBuffer call s:CloseThisBuffer()
endif

if !exists(':CloseOtherBuffers')
    command CloseOtherBuffers call s:CloseOtherBuffers()
endif

if !exists(':CloseHiddenBuffers')
    command CloseHiddenBuffers call s:CloseHiddenBuffers()
endif

if !exists(':CloseNamelessBuffers')
    command CloseNamelessBuffers call s:CloseNamelessBuffers()
endif

if !exists(':CloseSelectedBuffers')
    command CloseSelectedBuffers call s:CloseSelectedBuffers()
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
function! s:CloseBuffersMenu()
    let choice = confirm("Close Buffers?", s:confirm_string, 1)
    let function_name = s:letter_to_function_name[s:menu_option_letters[choice - 1]]
    if function_name != ''
        execute 'call s:' . function_name  . '()'
    endif
endfunction

function! s:CloseThisBuffer()
    confirm bdelete
endfunction

function! s:CloseAllBuffers()
    let all_buffers = range(1, bufnr('$'))
    let deleted_count = s:DeleteBuffers(all_buffers)
    call s:PrintSuccessMessage('All', deleted_count)
endfunction

function! s:CloseOtherBuffers()
    let all_buffers = range(1, bufnr('$'))
    let current_buffer = bufnr('%')
    let other_buffers = filter(all_buffers, 'v:val != current_buffer')
    let deleted_count = s:DeleteBuffers(other_buffers)
    call s:PrintSuccessMessage('Other', deleted_count)
endfunction

function! s:CloseHiddenBuffers()
    let hidden_buffers = map(filter(getbufinfo(), 'empty(v:val.windows)'), 'v:val.bufnr')
    let deleted_count = s:DeleteBuffers(hidden_buffers)
    call s:PrintSuccessMessage('Hidden', deleted_count)
endfunction

function! s:CloseSelectedBuffers()
    call s:PrettyPrintBufferList()
    let input_text = input('Type space-seperated buffer numbers and <Enter>: ')
    let selected_buffers = map(split(input_text), 'str2nr(v:val)')
    let deleted_count = s:DeleteBuffers(selected_buffers)
    call s:PrintSuccessMessage('Selected', deleted_count)
endfunction

function! s:CloseNamelessBuffers()
    let all_buffers = range(1, bufnr('$'))
    let nameless_buffers = filter(all_buffers, 'bufname(v:val) == ""')
    let deleted_count = s:DeleteBuffers(nameless_buffers)
    call s:PrintSuccessMessage('Nameless', deleted_count)
endfunction

" Auxiliary functions
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
