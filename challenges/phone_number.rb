require 'pry'

class PhoneNumber
  attr_accessor :phone_number, :phone_with_letters

  INVALID = "0" * 10

  def initialize(phone_number)
    @phone_number = phone_number
    @phone_with_letters = phone_number.tr('^A-z0-9', '')
  end

  def length
    phone_number.length
  end

  def first_char_one?
    phone_number.chr == "1"
  end

  def area_code
    number.slice(0, 3)
  end

  def local_exchange
    phone_number.slice(3, 3)
  end

  def line_number
    phone_number.slice(6, 4)
  end

  def to_s
    "(#{area_code}) #{local_exchange}-#{line_number}"
  end

  def initial_cleanup
    phone_number.tr!('^0-9', '')
  end

  def number
    initial_cleanup
    return INVALID if phone_with_letters.length > length
    phone_number.slice!(0) if first_char_one? && length == 11
    return INVALID if length < 10 || length == 11
    return INVALID if length == 12 && first_char_one?
    phone_number
  end
end
