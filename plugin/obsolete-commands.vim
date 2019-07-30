" Obsolete Commands
" --------------------
if !exists(':CloseAllBuffers')
  command -bang CloseAllBuffers echo 'Use :Bdelete All'
endif

if !exists(':CloseHiddenBuffers')
  command -bang CloseHiddenBuffers echo 'Use :Bdelete Hidden'
endif

if !exists(':CloseNamelessBuffers')
  command -bang CloseNamelessBuffers echo 'Use :Bdelete Nameless'
endif

if !exists(':CloseOtherBuffers')
  command -bang CloseOtherBuffers echo 'Use :Bdelete Other'
endif

if !exists(':CloseSelectedBuffers')
  command -bang CloseSelectedBuffers echo 'Use :Bdelete Select'
endif

if !exists(':CloseThisBuffer')
  command -bang CloseThisBuffer echo 'Use :Bdelete This'
endif

if !exists(':CloseBuffers')
  command -bang CloseBuffers echo 'Use :Bdelete Menu'
endif

if !exists(':CloseBuffersMenu')
  command -bang CloseBuffersMenu echo 'Use :Bdelete Menu'
endif
