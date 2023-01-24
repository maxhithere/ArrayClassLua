local Array = require(Array.lua)

-- create a new array
local newArray = Array.New()

-- push 5 entries into array
newArray:push(1)
newArray:push(2)
newArray:push(3)
newArray:push(4)
newArray:push(5)

print(myArray:length()) -- prints 5

-- print values in the array
for i, v in ipairs(newArray.values) do
  print(v) -- prints 1,2,3,4,5
end
