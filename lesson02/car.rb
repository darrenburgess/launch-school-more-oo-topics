class Car
  attr_accessor :wheels, :name

  def initialize
    @wheels = 4
  end
end

car = Car.new
puts "name: #{car.name}"
