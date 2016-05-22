require 'byebug'
#byebug

def reduce(array, start = 0)
  counter = 0
  result = start

  while counter < array.size
    block_result = yield(result, array[counter])
    result = block_result if block_result 
    counter += 1
  end

  result
end

array = [1, 2, 3, 4, 5]

p reduce(array) { |acc, num| acc + num }
p reduce(array, 10) { |acc, num| acc + num }
p reduce(array) { |acc, num| acc + num if num.odd? }
