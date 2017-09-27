# Close Vim Buffers 📖

Provides a command called `:CloseBuffers` which opens a dialog, showing you various options. Press the key corresponding to your desired action.
<table>
    <thead>
        <th>Key</th>
        <th>Action</th>
    </thead>
    <tbody>
    <tr>
        <td>c</td>
        <td>Cancel</td>
    </tr>
    <tr>
        <td>a</td>
        <td>Close <i>all</i> buffers</td>
    </tr>
    <tr>
        <td>t</td>
        <td>Close <i>this</i> buffer (buffer in current window)</td>
    </tr>
    <tr>
        <td>o</td>
        <td>Close <i>other</i> buffers (all except buffer in current window)</td>
    </tr>
    <tr>
        <td>h</td>
        <td>Close <i>hidden</i> buffers (buffers not displayed in a window)</td>
    </tr>
    <tr>
        <td>s</td>
        <td>Allows you to <i>select</i> which buffers to close</td>
    </tr>
    <tr>
        <td>n</td>
        <td>Close <i>nameless</i> buffers (buffers that show up as <i>[No Name]</i>)</td>
    </tr>
    </tbody>
</table>

Here is an example with `h`:

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

## Todo

- Add version number
- Add license file
