[1, 2, 3].each do |num|


  puts num
end

puts ''

3.times do |num|
  puts num
end

puts ''

arr = [1, 2, 3].map do |num|
  num + 1
end

puts arr.to_s

puts ''

File.open('tmp.txt', 'w') do |file|
  file.write('first line!')
end

5.times do
  |num|
  puts num
end

