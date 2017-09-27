# close-buffers.vim 📖

Provides various commands to close buffers.


<table>
    <thead>
        <th>Command</th>
        <th>Action</th>
    </thead>
    <tbody>
        <tr>
            <td>:CloseBuffers</td>
            <td>Open a menu allowing you to choose one of the other commands</td>
        </tr>
        <tr>
            <td>:CloseAllBuffers</td>
            <td>Close all buffers</td>
        </tr>
        <tr>
            <td>:CloseThisBuffer</td>
            <td>Close buffer in current window</td>
        </tr>
        <tr>
            <td>:CloseOtherBuffers</td>
            <td>Close all buffers <i>except</i> buffer in current window</td>
        </tr>
        <tr>
            <td>:CloseHiddenBuffers</td>
            <td>Close buffers not displayed in a window</td>
        </tr>
        <tr>
            <td>:CloseNamelessBuffers</td>
            <td>Close buffers without names (that show up as <i>[No Name]</i>)</td>
        </tr>
        <tr>
            <td>:CloseSelectedBuffers</td>
            <td>Allows you to select which buffers to close</td>
        </tr>
    </tbody>
</table>

Here is an example using the command `:CloseBuffers` followed by a response of `h`:

![Screenshot](/doc/screencapture.gif?raw=true)

## Recommended Mapping

    nnoremap <silent> Q :CloseBuffers<CR>

#### Alternative:

    nnoremap <silent> <C-q> :CloseBuffers<CR>
## Install
You can use any plugin manager you want. Here are some popular options:

- [vim-plug](https://github.com/junegunn/vim-plug)
  - `Plug 'Asheq/close-buffers.vim'`
- [Pathogen](https://github.com/tpope/vim-pathogen)
  - `cd ~/.vim/bundle && git clone git://github.com/asheq/close-buffers.git`
- Manual installation:
  - Copy the files to your `.vim` directory.

## Credits
This plugin was inspired by [vim-bufonly](https://github.com/schickling/vim-bufonly), but adds
several related actions.

## License
Same license as Vim itself
