# Vim Loche

Did ever wonder why location lists belong to windows and not files or buffers?
Depending on how the location list gets used, it includes usually location
for the buffer displayed in the current window. Such are for example errors by
a linter or internal search results. Lists with location entries that belong
to more than one file usually go into the |quickfix| list. The point when this
becomes annoying is when you switch the buffer within a window. Because the
location list and the possibly open location window remain the same. So taking
the earlier example, you have location list with linting errors for the
current file. Maybe you need to switch the buffer to fix an error. So while
the window now shows a different file, the location lists still shows content
related to a different file.

If you use location lists like that, then this plugin can help you. This
automatically ties the location lists to files and take care of manging your
location window. It automatically caches them in-between buffer switches and
maintain the open window state.

## Installation

Install the plugin with your favorite manager tool. Here is an example using
[dein.vim](https://github.com/Shougo/dein.vim):

```vim
call dein#add('weilbith/vim-loche')
```

## Usage

The plugin works out of the box. Checkout the documentation how to customize its
behavior.
