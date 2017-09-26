## Dialog to Close Vim Buffers

Provides a command called `:CloseBuffers` which opens a dialog to close buffers. You will see the following:

    ![screenshot](https://github.com/asheq/close-buffers.vim/blob/maseter/doc/screenshot.png)

Press the key corresponding to your desired action. See the table below
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
        <td>Close *this* buffer (the current buffer)</td>
    </tr>
    <tr>
        <td>a</td>
        <td>Close *all* buffers</td>
    </tr>
    <tr>
        <td>o</td>
        <td>Close *other* buffers (all buffers except the current buffer)</td>
    </tr>
    <tr>
        <td>s</td>
        <td>Allows you to *select* which buffer to close</td>
    </tr>
    <tr>
        <td>n</td>
        <td>Close *nameless* buffers (buffers that show up as [No Name])</td>
    </tr>
    </tbody>
</table>
