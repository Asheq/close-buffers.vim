## Dialog to Close Vim Buffers

Provides a command called `:CloseBuffers` which opens a dialog to close buffers. You can press the key corresponding to your desired action. See the table below for all options.

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

Here is an example after pressing `o`

![Screenshot](/doc/screencapture.gif?raw=true)

