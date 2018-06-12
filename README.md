# <code>close-buffers.vim</code>

Quickly close several buffers you are no longer using.

[![asciicast](https://asciinema.org/a/Q4nw2vqtuXE5X23vUtPw1PsFO.png)](https://asciinema.org/a/Q4nw2vqtuXE5X23vUtPw1PsFO)

## Usage

Here is the full list of commands:

<table>
    <thead>
        <th>Command</th>
        <th>Action</th>
        <th>Native Alternative</th>
    </thead>
    <tbody>
        <tr>
            <td><code>:CloseBuffersMenu</code></td>
            <td>Open a menu allowing you to choose one of the other commands</td>
            <td></td>
        </tr>
        <tr>
            <td><code>:CloseOtherBuffers</code> <br></td>
            <td>Close all buffers <i>except</i> buffer in current window</td>
            <td></td>
        </tr>
        <tr>
            <td><code>:CloseHiddenBuffers</code> <br></td>
            <td>Close all buffers not displayed in any window</td>
            <td></td>
        </tr>
        <tr>
            <td><code>:CloseNamelessBuffers</code></td>
            <td>Close buffers without names (that show up as <i>[No Name]</i>)</td>
            <td></td>
        </tr>
        <tr>
            <td><code>:CloseSelectedBuffers</code></td>
            <td>Allows you to select which buffers to close</td>
            <td></td>
        </tr>
        <tr>
            <td><code>:CloseAllBuffers</code></td>
            <td>Close all buffers</td>
            <td><code>:bufdo bd</code></td>
        </tr>
        <tr>
            <td><code>:CloseThisBuffer</code></td>
            <td>Close buffer in current window</td>
            <td><code>:bd</code></td>
        </tr>
    </tbody>
</table>


## Recommended Mapping

I recommend that you map `:CloseBuffersMenu` to `Q`. (The default behavior of `Q` is to switch to "Ex" mode, which you will likely never need to use).

    nnoremap <silent> Q :CloseBuffersMenu<CR>

Another option is to map `:CloseBuffersMenu`. (The default behavior of `<C-q>` is the same as `<C-v>` which is to enter visual block mode)

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
