require 'pry'

class Octal2
  attr_reader :number
  
  def initialize(number)
    @number = number
  end

  def invalid_octal?
    number.match(/[\D89]/)
  end

  def to_decimal
    return 0 if invalid_octal?
    number.to_s.reverse.chars.each_with_index.map do |num, idx|
      (num.to_i * 8 ** idx).to_i
    end.reduce(0, :+)
  end
end

class Octal
  attr_reader :number
  attr_accessor :array

  def initialize(number)
    @number = number
  end

  def invalid_octal?
    number.match(/[\D89]/)
  end

  def to_decimal
    return 0 if invalid_octal?
    split_digits_into_array
    reverse_array_of_digits
    convert_each_digit
    sum_values_in_array
  end

  private

  def split_digits
    array = number.to_s.chars
  end

  def reverse_array_of_digits
    array.reverse!
  end

  def convert_each_digit
  end

  def sum_values_in_array
  end
end
 
