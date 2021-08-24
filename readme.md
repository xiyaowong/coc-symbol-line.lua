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

This plugin updates somes buffer-scoped(b:) variables.

- `coc_symbol_line`
- `coc_symbol_line_items`

Print them to get details

### render

set `g:coc_symbol_line_render` to choose what render you want. Default to None

#### echo

`let g:coc_symbol_line_render = 'echo'`

echo in command line with colors

![image](https://user-images.githubusercontent.com/47070852/130636466-14d8904b-ab3f-416b-8519-6a2b6d3c2529.png)
