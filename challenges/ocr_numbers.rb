require 'pry'

class OCR
  attr_accessor :characters

  CHARACTERS = {
    " _\n| |\n|_|\n": "0",
    "\n  |\n  |\n":   "1",
    " _\n _|\n|_\n":  "2",
    " _\n _|\n _|\n": "3",
    "\n|_|\n  |\n":   "4",
    " _\n|_\n _|\n":  "5",
    " _\n|_\n|_|\n":  "6",
    " _\n  |\n  |\n": "7",
    " _\n|_|\n|_|\n": "8",
    " _\n|_|\n _|\n": "9"
  }

  ENCODING = {
    0 => [0, 1, 0, 1, 0, 1, 1, 1, 1],
    1 => [0, 0, 1, 0, 0, 1],
    2 => [0, 1, 0, 0, 1, 1, 1, 1, 0],
    3 => [0, 1, 0, 0, 1, 1, 0, 1, 1],
    4 => [1, 1, 1, 0, 0, 1],
    5 => [0, 1, 0, 1, 1, 0, 0, 1, 1],
    6 => [0, 1, 0, 1, 1, 0, 1, 1, 1],
    7 => [0, 1, 0, 0, 0, 1, 0, 0, 1],
    8 => [0, 1, 0, 1, 1, 1, 1, 1, 1],
    9 => [0, 1, 0, 1, 1, 1, 0, 1, 1]
  }

  def initialize(text)
    @text = text
    @characters = []
  end
  
  def parse
    @text.each_line do |line|
      length = line.gsub("\n", "").length
      chars = (length/3.to_f).ceil
      chars.times do |num|
        @characters[num] = "" if @characters[num] == nil
        @characters[num] << line[(num * 2)..(num * 2 + 2)]
      end
    end
  end

  def convert
    CHARACTERS[@text.to_sym]
  end

  def convertold
    parse
    size = @characters.size
    result = ""
    size.times do |num|
      encoding = encode(@characters[num])
      result = ENCODING.select do |key, value|
        value == encoding
      end
      final = result.keys.first.to_s
      return "?" if final == ""
      result << final 
    end
    result
  end
end

text = <<-NUMBER.chomp
  
  |
  |

NUMBER

test = OCR.new(text)
p test.convert


