Array = {}
Array.__index = Array

function Array.new(initialValues)
  local self = setmetatable({}, Array)
  self.values = initialValues or {}
  return self
end

-- Methods
function Array:push(value)
  table.insert(self.values, value)
end

function Array:pop()
  return table.remove(self.values)
end

function Array:length()
  return #self.values
end

function Array:concat(otherArray)
  return Array.new(table.concat(self.values, otherArray.values))
end

function Array:filter(fn)
  local filtered = {}
  for i, value in ipairs(self.values) do
    if fn(value) then
      table.insert(filtered, value)
    end
  end
  return Array.new(filtered)
end

function Array:find(fn)
  for i, value in ipairs(self.values) do
    if fn(value) then
      return value
    end
  end
end

function Array:forEach(fn)
  for i, value in ipairs(self.values) do
    fn(value, i, self.values)
  end
end

function Array:includes(value)
  for i, val in ipairs(self.values) do
    if val == value then
      return true
    end
  end
  return false
end

function Array:indexOf(value)
  for i, val in ipairs(self.values) do
    if val == value then
      return i
    end
  end
  return -1
end

function Array:map(fn)
  local mapped = {}
  for i, value in ipairs(self.values) do
    table.insert(mapped, fn(value))
  end
  return Array.new(mapped)
end

function Array:reduce(fn, initialValue)
  local accumulator = initialValue or self.values[1]
  for i = (initialValue and 0 or 2), #self.values do
    accumulator = fn(accumulator, self.values[i])
  end
  return accumulator
end

function Array:reverse()
  local reversed = {}
  for i = #self.values, 1, -1 do
    table.insert(reversed, self.values[i])
  end
  self.values = reversed
end

function Array:shift()
  return table.remove(self.values, 1)
end

function Array:slice(start, finish)
  return Array.new(table.move(self.values, start, finish, 1, {}))
end

function Array:sort(fn)
  table.sort(self.values, fn)
end

function Array:join(separator)
  return table.concat(self.values, separator)
end

function Array:keys()
  local keys = {}
  for i, value in ipairs(self.values) do
    table.insert(keys, i)
  end
    return Array.new(keys)
end

function Array:rotate(n)
  local rotated = {}
  local len = #self.values
  for i = 1, len do
    local new_index = (i + n - 1) % len + 1
    rotated[new_index] = self.values[i]
  end
  self.values = rotated
end

function Array:some(fn)
  for i, value in ipairs(self.values) do
    if fn(value) then
      return true
    end
  end
  return false
end

function Array:unshift(value)
  table.insert(self.values, 1, value)
end

function Array:values()
  return Array.new(self.values)
end

function Array:fill(value, start, finish)
  start = start or 1
  finish = finish or #self.values
  for i = start, finish do
    self.values[i] = value
  end
end
