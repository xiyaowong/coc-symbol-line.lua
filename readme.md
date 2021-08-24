# coc-symbol-line

![image](https://user-images.githubusercontent.com/47070852/130612399-a681b381-e17b-477b-9470-6baf0f37cfdf.png)

This plugin requires neovim5.0+

## Installation

Using vim-plug

```viml
Plug 'xiyaowong/coc-symbol-line.lua'
```

Using dein

```viml
call dein#add('xiyaowong/coc-symbol-line.lua')
```

Using packer.nvim

```lua
use 'xiyaowong/coc-symbol-line.lua'
```

## Configuration

Currently, there are no configuration items

## Usage

use buffer-scoped variable to get this line

in vimscript

```viml
get(b:, 'coc_symbol_line', '')
```

in lua

```lua
vim.b.coc_symbol_line or ''
```
