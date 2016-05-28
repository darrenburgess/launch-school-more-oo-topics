require 'pry'

class SecretHandshake
  attr_reader :number
  attr_accessor :result

  def initialize number
    @number = number
    @result = []
  end

  def to_binary
    number.to_s(2)
  end

  def is_true?(value)
    value == '1'
  end

  def commands
    return [] if number.class == String
    array = self.to_binary.split('').reverse
    result << "wink" if is_true? array[0]
    result << "double blink" if is_true? array[1]
    result << "close your eyes" if is_true? array[2]
    result << "jump" if is_true? array[3]
    result.reverse! if is_true? array[4]
    result
  end
end
