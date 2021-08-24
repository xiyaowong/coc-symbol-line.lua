local function echohl(hl)
  vim.cmd('echohl ' .. hl)
end

local function echon(msg)
  vim.cmd(string.format([[echon '%s']], msg))
end

local function echo(items)
  vim.cmd "echo ''"
  for idx, item in ipairs(items) do
    if idx ~= 1 then
      echohl 'LineNr'
      echon ' > '
    end
    echohl(item.hl)
    echon(item.label)
    echohl 'NONE'
    echon(' ' .. item.text)
  end
  echohl 'NONE'
end

return { echo = echo }
