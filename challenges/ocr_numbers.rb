require 'pry'

class OCR
  attr_reader :text

  NUMBERS = {
    " _\n| |\n|_|\n" => "0",
    "\n  |\n  |\n" => "1",
    " _\n _|\n|_\n" => "2",
    " _\n _|\n _|\n" => "3",
    "\n|_|\n  |\n" => "4",
    " _\n|_\n _|\n" => "5",
    " _\n|_\n|_|\n" => "6",
    " _\n  |\n  |\n" => "7",
    " _\n|_|\n|_|\n" => "8",
    " _\n|_|\n _|\n" => "9"
  }

  GARBLE = '?'
  DIGIT_WIDTH = 3

  def initialize(text)
    @text = text
  end

  def convert
    return convert_lines(text) if multiple_lines?
    return convert_multiple_digits(text) if multiple_digits?
    return convert_single_digit(text) if single_digit?
  end

  private

  def single_digit?
    text.split("\n").first.size <= DIGIT_WIDTH
  end

  def multiple_digits?
    text.split("\n").first.size > DIGIT_WIDTH
  end

  def multiple_lines?
    text.match(/\n\n/)
  end

  def convert_single_digit(digit)
    NUMBERS[digit] || GARBLE
  end

  def convert_multiple_digits(digits)
    digits = parse_digits(digits)

    result = ''
    digits.each do |digit|
      result << convert_single_digit(digit)
    end

    result

    # Below could work too:

    # parse_digits(digits).reduce('') do |acc, digit|
    #   acc + convert_single_digit(digit)
    # end
  end

  def parse_digits(digits)
    result = []

    digits.each_line do |line|
      line.scan(/.{1,#{DIGIT_WIDTH}}/).each_with_index do |part, i|
        result[i] ||= ''
        result[i] << normalize_digit_row(part)
      end
    end

    result
  end

  # single digits are not truly 3x4
  # so we have to normalize digits from multi-digit input to match
  def normalize_digit_row(part)
    if part.count(' ') == DIGIT_WIDTH
      "\n"
    elsif part == " _ "
      " _\n"
    elsif part == "|_ "
      "|_\n"
    else
      "#{part}\n"
    end
  end

  def convert_lines(input)
    lines = parse_lines(input)

    result = []
    lines.each do |line|
      result << convert_multiple_digits(line)
    end

    result.join(',')

    # Below could work too:

    # parse_lines(input)
    #  .map{|line| convert_multiple_digits(line)}
    #  .join(',')
  end

  def parse_lines(input)
    input.split("\n\n")
  end
end
