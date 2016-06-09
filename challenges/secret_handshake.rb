require 'pry'

class SecretHandshake
  attr_reader :number
  attr_accessor :result

  def initialize(number)
    @number = number
    @result = []
  end

  def to_binary
    number.to_s(2)
  end

  def true?(value)
    value == '1'
  end

  def commands
    return [] if number.class == String
    array = to_binary.split('').reverse
    result << 'wink' if true? array[0]
    result << 'double blink' if true? array[1]
    result << 'close your eyes' if true? array[2]
    result << 'jump' if true? array[3]
    result.reverse! if true? array[4]
    result
  end
end
