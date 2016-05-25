require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!
system 'clear'

require_relative 'car'

describe 'Car#wheels' do
  it 'has 4 wheels' do
    car = Car.new
    car.wheels.must_equal 4
  end
end

