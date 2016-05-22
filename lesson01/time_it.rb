require 'byebug'
require 'pry'
#byebug

def time_it
  time_before = Time.now.to_i
  yield
  time_after = Time.now.to_i
  duration = (time_after - time_before)
  binding.pry
  duration
end

p time_it { 10000.times { puts "hello" } }
