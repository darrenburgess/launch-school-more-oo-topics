require 'byebug'
#byebug

def select(array)
  counter = 0
  final_array = []

  while counter < array.size
    result = yield(array[counter])
    final_array << array[counter] if result
    counter += 1
  end

  final_array
end

array = [1, 2, 3, 4, 5]

p select(array) { |num| num.odd? }
p select(array) { |num| puts num }
p select(array) { |num| num +1 }
