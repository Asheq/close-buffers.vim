# close-buffers.vim 📖

<table>
    <thead>
        <th>Command</th>
        <th>Action</th>
        <th>Simple Native Alternative</th>
    </thead>
    <tbody>
        <tr>
            <td>`:CloseBuffersMenu` or just `:CloseBuffers`</td>
            <td>Open a menu allowing you to choose one of the other commands</td>
            <td></td>
        </tr>
        <tr>
            <td>`:CloseOtherBuffers` <i>(:fire: <i>popular)</i></td>
            <td>Close all buffers <i>except</i> buffer in current window</td>
            <td></td>
        </tr>
        <tr>
            <td>`:CloseHiddenBuffers` <i>(:fire: popular)</i></td>
            <td>Close all buffers not displayed in any window</td>
            <td></td>
        </tr>
        <tr>
            <td>`:CloseNamelessBuffers`</td>
            <td>Close buffers without names (that show up as <i>[No Name]</i>)</td>
            <td></td>
        </tr>
        <tr>
            <td>`:CloseSelectedBuffers`</td>
            <td>Allow user to select which buffers to close</td>
            <td></td>
        </tr>
        <tr>
            <td>`:CloseAllBuffers`</td>
            <td>Close all buffers</td>
            <td>`:bufdo bd`</td>
        </tr>
        <tr>
            <td>`:CloseThisBuffer`</td>
            <td>Close buffer in current window</td>
            <td>`:bd`</td>
        </tr>
    </tbody>
</table>

[![asciicast](https://asciinema.org/a/Q4nw2vqtuXE5X23vUtPw1PsFO.png)](https://asciinema.org/a/Q4nw2vqtuXE5X23vUtPw1PsFO)

## Recommended Mapping

    nnoremap <silent> Q :CloseBuffersMenu<CR>

#### Alternative:

    nnoremap <silent> <C-q> :CloseBuffersMenu<CR>
## Install
You can use any plugin manager you want. Here are some popular options:

- vim-plug: `Plug 'Asheq/close-buffers.vim'`
- Pathogen: `cd ~/.vim/bundle && git clone git://github.com/asheq/close-buffers.git`
- Manual installation: Copy the files to your `.vim` directory.

## Inspiration
This plugin was inspired by [vim-bufonly](https://github.com/schickling/vim-bufonly), but adds
several related actions.

## License
Same license as Vim itself
