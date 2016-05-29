require 'pry'

class OCR
  ENCODING = {
    0 => [0, 1, 0, 1, 0, 1, 1, 1, 1],
    1 => [0, 0, 0, 0, 0, 1, 0, 0, 1],
    2 => [0, 1, 0, 1, 0, 1, 1, 1, 1],
    3 => [0, 1, 0, 0, 1, 1, 0, 1, 1],
    4 => [0, 0, 0, 1, 1, 1, 0, 0, 1],
    5 => [0, 1, 0, 1, 1, 0, 0, 1, 1],
    6 => [0, 1, 0, 1, 1, 0, 1, 1, 1],
    7 => [0, 1, 0, 0, 0, 1, 0, 0, 1],
    8 => [0, 1, 0, 1, 1, 1, 1, 1, 1],
    9 => [0, 1, 0, 1, 1, 1, 0, 1, 1]
  }

  def initialize(text)
    @text = text
  end
  
  def is_true?(str)  
    str == '_' || str == '|'
  end

  def encode
    chars = @text.gsub("\n", "").split ''
    chars.map { |char| is_true?(char) ? 1 : 0 }
  end

  def convert
    encoding = encode
    result = ENCODING.select do |key, value|
      value == encoding
    end  # .keys.first.to_s
    result.keys.first.to_s
  end
end

text = <<-NUMBER.chomp
 _ 
|_|
|_|

NUMBER

test = OCR.new(text).convert
p test
