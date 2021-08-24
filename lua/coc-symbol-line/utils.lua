local function compare_position(position, other)
  if position.line > other.line then
    return 1
  end
  if other.line == position.line and position.character > other.character then
    return 1
  end
  if other.line == position.line and position.character == other.character then
    return 0
  end
  return -1
end

local function position_in_range(position, range)
  if compare_position(position, range['start']) < 0 then
    return -1
  end

  if compare_position(position, range['end']) > 0 then
    return 1
  end

  return 0
end

return { compare_position = compare_position, position_in_range = position_in_range }
