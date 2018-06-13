# close-buffers.vim

Quickly close several buffers you are no longer using.

![demo](https://raw.githubusercontent.com/Asheq/close-buffers.vim/master/img/demo-speed.gif)

## Most Useful Commands

#### `:CloseOtherBuffers` :fire:
&nbsp; &nbsp; &nbsp; &nbsp; Closes all buffers *except* the one in the current window.
#### `:CloseHiddenBuffers` :fire:
   Closes all buffers not displayed in *any* window.

#### `:CloseBuffersMenu` :fire:
   Opens a menu allowing you to choose one of the other commands.

## Other Commands

#### `:CloseNamelessBuffers`
   Close buffers without names (that show up as *[No Name]*).
    
#### `:CloseSelectedBuffers`
   Allows you to select which buffers to close.

#### `:CloseAllBuffers`
   Closes all buffers. You can do this natively with `:bufdo bd`

#### `:CloseThisBuffer`
   Close buffer in current window. You can do this natively with `:bd`

## Recommended Mapping

I recommend that you map `:CloseBuffersMenu` to `Q`. (The default behavior of `Q` is to switch to "Ex" mode, which you will likely never need to use).

    nnoremap <silent> Q :CloseBuffersMenu<CR>

Another option is to map `:CloseBuffersMenu` to `<C-q>`. (The default behavior of `<C-q>` is the same as `<C-v>` which is to enter visual block mode)

    nnoremap <silent> <C-q> :CloseBuffersMenu<CR>
    
## Install
You can use any plugin manager you want. Some popular options:

- vim-plug: `Plug 'Asheq/close-buffers.vim'`
- Vundle: `Plugin 'Asheq/close-buffers.vim'`
- Pathogen: `cd ~/.vim/bundle && git clone git://github.com/asheq/close-buffers.git`
- Manual: Copy the files into your `.vim` directory.

## Inspiration
This plugin was inspired by [vim-bufonly](https://github.com/schickling/vim-bufonly), but adds
several related actions.

## License
Same license as Vim itself
