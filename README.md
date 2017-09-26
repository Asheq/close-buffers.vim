## Dialog to Close Vim Buffers

Provides a command called `:CloseBuffers` which opens a dialog to close buffers. You will see the following:

![Screenshot](/doc/screenshot.png?raw=true)
    
At this point, you can press the key corresponding to your desired action. See the table below
for details.

<table>
    <thead>
        <th>Key</th>
        <th>Result</th>
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

### Recommended Mapping

Many people map `Q` to `<NOP>`. Why not make use of `Q` by mapping it to `:CloseBuffers` as follows?

    nnoremap <silent> Q :CloseBuffers<CR>
    
An *alternative* is to use `<C-q>`. By default, `<C-q>` is made redundant by `<C-v>` (they both start visual block mode by default).

    nnoremap <silent> <C-q> :CloseBuffers<CR>
