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
    local newIndex = (i + n - 1) % len + 1
    rotated[newIndex] = self.values[i]
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

function Array:shuffle()
  for i = #self.values, 2, -1 do
    local j = math.random(i)
    self.values[i], self.values[j] = self.values[j], self.values[i]
  end
end

function Array:every(fn)
  for i, value in ipairs(self.values) do
    if not fn(value) then
      return false
    end
  end
  return true
end

function Array:flat(depth)
  depth = depth or 1
  local flattened = {}
  local function flattenHelper(arr, currentDepth)
    if currentDepth == 0 then
      for _, value in ipairs(arr) do
        table.insert(flattened, value)
      end
    else
      for _, value in ipairs(arr) do
        if type(value) == "table" then
          flattenHelper(value, currentDepth - 1)
        else
          table.insert(flattened, value)
        end
      end
    end
  end
  flattenHelper(self.values, depth)
  return Array.new(flattened)
end

function Array:flatMap(fn)
  local mapped = {}
  for i, value in ipairs(self.values) do
    local result = fn(value, i, self.values)
    if type(result) == "table" then
      for _, mappedValue in ipairs(result) do
        table.insert(mapped, mappedValue)
      end
    else
      table.insert(mapped, result)
    end
  end
  return Array.new(mapped)
end

function Array:last()
  return self.values[#self.values]
end

function Array:first()
  return self.values[1]
end

function Array:toString()
  local str = "["
  for i, value in ipairs(self.values) do
    if i > 1 then
      str = str .. ", "
    end
    if type(value) == "string" then
      str = str .. "\"" .. value .. "\""
    else
      str = str .. tostring(value)
    end
  end
  str = str .. "]"
  return str
end

function Array:unique()
  local unique = {}
  for i, value in ipairs(self.values) do
    if not unique[value] then
      unique[value] = true
    end
  end
  local result = {}
  for value, _ in pairs(unique) do
    table.insert(result, value)
  end
  return Array.new(result)
end

function Array:splice(start, deleteCount, ...)
  local deleted = {}
  local valuesToAdd = {...}
  local numValuesToAdd = #valuesToAdd
  local numValuesToDelete = deleteCount or 0
  local numValues = #self.values
  local endOfDeleted = start + numValuesToDelete - 1
  for i = start, endOfDeleted do
    table.insert(deleted, self.values[i])
  end
  if numValuesToAdd > numValuesToDelete then
    local diff = numValuesToAdd - numValuesToDelete
    for i = numValues, start, -1 do
      local newIdx = i + diff
      self.values[newIdx] = self.values[i]
    end
  elseif numValuesToAdd < numValuesToDelete then
    local diff = numValuesToDelete - numValuesToAdd
    for i = start, numValues - diff do
      local oldIdx = i + diff
      self.values[i] = self.values[oldIdx]
    end
    for i = numValues, numValues - diff + 1, -1 do
      self.values[i] = nil
    end
  end
  for i = 1, numValuesToAdd do
    local newIdx = start + i - 1
    self.values[newIdx] = valuesToAdd[i]
  end
  return Array.new(deleted)
end
