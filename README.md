# Dialog to Close Vim Buffers 📖

Provides a command called `:CloseBuffers`. This will open a dialog, showing you various options. Press the key corresponding to your desired action.
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
        <td>t</td>
        <td>Close <i>this</i> buffer (the current buffer)</td>
    </tr>
    <tr>
        <td>a</td>
        <td>Close <i>all</i> buffers</td>
    </tr>
    <tr>
        <td>o</td>
        <td>Close <i>other</i> buffers (all buffers except the current buffer)</td>
    </tr>
    <tr>
        <td>s</td>
        <td>Allows you to <i>select</i> which buffer to close</td>
    </tr>
    <tr>
        <td>n</td>
        <td>Close <i>nameless</i> buffers (buffers that show up as <i>[No Name]</i>)</td>
    </tr>
    </tbody>
</table>

Here is an example with `o`:

![Screenshot](/doc/screencapture.gif?raw=true)

## Recommended Mapping

Many people map `Q` to `<NOP>`. Why not make use of `Q` by mapping it to `:CloseBuffers` as follows?

    nnoremap <silent> Q :CloseBuffers<CR>
    
An *alternative* is to use `<C-q>`. By default, `<C-q>` is made redundant by `<C-v>` (they both start visual block mode by default).

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

I was inspired by [vim-bufonly](https://github.com/schickling/vim-bufonly), but wanted to add a few more options.

## TODO

- Add version number
- Add license file
