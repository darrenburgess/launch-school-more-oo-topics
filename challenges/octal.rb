require 'pry'

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
    number.to_s.reverse.chars.each_with_index.map do |num, idx|
      (num.to_i * 8 ** idx).to_i
    end.reduce(0, :+)
  end
end
