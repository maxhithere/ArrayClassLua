# ArrayClassLua
an optimized array class for lua with many methods

## Create a new array:

<Array>.new()


## Methods:

  - <Array>:push(value) - adds an element to the array
  - <Array>:pop() - removes the last element of the array
  - <Array>:length() - number of elements in the array
  - <Array>:concat(otherArray) - concatenates the current array with another array
  - <Array>:filter(fn) - creates a new array with elements that pass a given test
  - <Array>:find(fn) - finds first element(s) that passes a given test
  - <Array>:forEach(fn) - performs a function on each element of the array
  - <Array>:includes(value) - checks if an element exists in the array
  - <Array>indexOf(value) - returns the index of an element in the array
  - <Array>:map(fn) - creates a new array with the results of a function applied to each element
  - <Array>:reduce(fn, initialValue) - applies a function to all elements of the array and returns a single value
  - <Array>:reverse() -  reverses the order of the elements in the array
  - <Array>:shift() - removes the first element of the array
  - <Array>:slice(start, finish) - creates a new array with selected elements
  - <Array>:sort(fn) - sorts the elements of the array
  - <Array>:join(seperator) - creates a string by concatenating the elements of the array, separated by a specified separator
  - <Array>:keys() -  an array of the keys of the elements
  - <Array>:rotate(n) - rotates the array by a certain amount of positions
  - <Array>:some(fn) - checks if at least one element of the array passes a given test
  - <Array>:unshift(value) - adds an element to the beginning of the array
  - <Array>:values() - returns an array of the values of the elements
  - <Array>:fill(value, start, finish) - fills the elements of the array
  - <Array>:shuffle() - intermix elements in the array in place
