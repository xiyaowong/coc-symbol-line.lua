augroup RefreshCocSymbolLine
  autocmd!
  autocmd CursorHold * lua require'coc-symbol-line'.refresh()
augroup END
