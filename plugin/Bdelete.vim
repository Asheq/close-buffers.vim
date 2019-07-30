" Helper variables
" --------------------
let s:flags =      ["Menu"  , "Other", "Hidden", "Nameless", "All", "Select", "This"]
let s:menu_flags = ["Cancel", "Other", "Hidden", "Nameless", "All", "Select", "This"]

function! s:get_menu_confirm_string()
  let menu_flags = deepcopy(s:menu_flags)
  let menu_flags_with_amp = map(menu_flags, '"&" . v:val')
  return join(menu_flags_with_amp, "\n")
endfunction

let s:menu_confirm_string = s:get_menu_confirm_string()

" Main :Bdelete command and s:Bdelete function
" ---------------------------------------------
if exists(':Bdelete')
  echo 'close-buffers.vim: You already have a ":Bdelete" command defined'
else
  command -bang -nargs=1 -complete=customlist,s:BdeleteCompletionOptions Bdelete call s:Bdelete(<bang>0, <f-args>)
endif

function! s:Bdelete(bang, flag)
  if index(s:flags, a:flag) >= 0
    execute 'call s:Bdelete_' . a:flag  . '('. a:bang . ')'
  else
    echo 'Invalid flag'
  endif
endfunction

function! s:BdeleteCompletionOptions(ArgLead, CmdLine, CursorPos) abort
  let matches = []
  for f in s:flags
    if f =~ '^' . a:ArgLead
      call add(matches, f)
    endif
  endfor
  return matches
endfunction

" Functions
" --------------------
"  TODO: Make a separate command
function! s:Bdelete_Menu(bang)
  let choice = confirm("Delete Buffers?", s:menu_confirm_string, 1)
  if (choice != 1)
    let flag = s:menu_flags[choice - 1]
    call s:Bdelete(a:bang, flag)
  endif
endfunction

function! s:Bdelete_Other(bang)
  let current_buffer = bufnr('%')
  let other_buffers = map(filter(s:getListedOrLoadedBuffers(), 'v:val.bufnr != current_buffer'), 'v:val.bufnr')
  call s:DeleteBuffers(other_buffers, a:bang)
endfunction

function! s:Bdelete_Hidden(bang)
  let hidden_buffers = map(filter(s:getListedOrLoadedBuffers(), 'empty(v:val.windows)'), 'v:val.bufnr')
  call s:DeleteBuffers(hidden_buffers, a:bang)
endfunction

function! s:Bdelete_Nameless(bang)
  let nameless_buffers = map(filter(s:getListedOrLoadedBuffers(), 'v:val.name == ""'), 'v:val.bufnr')
  call s:DeleteBuffers(nameless_buffers, a:bang)
endfunction

function! s:Bdelete_All(bang)
  let all_buffers = map(s:getListedOrLoadedBuffers(), 'v:val.bufnr')
  call s:DeleteBuffers(all_buffers , a:bang)
endfunction

" TODO: Make a separate command?
function! s:Bdelete_Select(bang)
  pwd
  ls
  call feedkeys(':' . s:GetBufferDeleteCommand(a:bang) . ' ')
endfunction

function! s:Bdelete_This(bang)
  execute s:GetBufferDeleteCommand(a:bang)
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

function! s:getListedOrLoadedBuffers()
  return filter(getbufinfo(), 'v:val.listed || v:val.loaded')
endfunction

