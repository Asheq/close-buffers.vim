# close-buffers.vim

Quickly close several buffers that you no longer need.

![demo](https://raw.githubusercontent.com/Asheq/close-buffers.vim/master/img/demo-speed.gif)

## Most Useful Commands

#### `:CloseOtherBuffers` :fire:
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Close all buffers *except* buffer in current window.
#### `:CloseHiddenBuffers` :fire:
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Close all buffers not visible in *any* window.

#### `:CloseBuffersMenu` :fire:
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Lets you choose any other commands.

## More Commands

#### `:CloseNamelessBuffers`
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Close buffers without names (*[No Name]*).
    
#### `:CloseSelectedBuffers`
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Lets you select which buffers to close.

#### `:CloseAllBuffers`
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Close all buffers. You can do this natively with `:bufdo bd`

#### `:CloseThisBuffer`
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Close buffer in current window. You can do this natively with `:bd`

## Recommended Mapping

I recommend that you map `:CloseBuffersMenu` to `Q`:
(The default behavior of `Q` is to switch to "Ex" mode, which you will likely never need to use)

    nnoremap <silent> Q :CloseBuffersMenu<CR>

Another option is to map `:CloseBuffersMenu` to `<C-q>`:
(The default behavior of `<C-q>` is the same as `<C-v>` which is to enter visual block mode)

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
