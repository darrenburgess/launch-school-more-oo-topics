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
      (num.to_i * 8**idx).to_i
    end.reduce(0, :+)
  end
end

class Octal3
  attr_reader :number

  def initialize(number)
    @number = number
    @array = []
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

  def split_digits_into_array
    @array = number.to_s.chars
  end

  def reverse_array_of_digits
    @array.reverse!
  end

  def convert_each_digit
    result = @array.each_with_index.to_a.map! do |num, idx|
      (num.to_i * 8**idx)
    end
    @array = result
  end

  def sum_values_in_array
    @array.reduce(0, :+)
  end
end

class Octal
  attr_reader :number

  def initialize(number)
    @number = number
  end

  def invalid_octal?
    number.match(/[\D89]/)
  end

  def to_decimal
    return 0 if invalid_octal?
    digits_reversed    = number.to_s.chars.reverse
    digits_converted   =
      digits_reversed.each_with_index.to_a.map do |num, idx|
        num.to_i * 8**idx
      end
    digits_summed      = digits_converted.reduce(0, :+)
    digits_summed
  end
end
