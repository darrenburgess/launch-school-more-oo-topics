require 'minitest/autorun'
require 'minitest/reporters'
require 'pry'

require_relative 'ocr_numbers'
MiniTest::Reporters.use!
system 'clear'

class OCRTest < MiniTest::Test
  def test_recognize_zero
    text = <<-NUMBER.chomp
 _
| |
|_|

    NUMBER
    assert_equal '0', OCR.new(text).convert
  end

  def test_recognize_one
    text = <<-NUMBER.chomp

  |
  |

    NUMBER
    assert_equal '1', OCR.new(text).convert
  end

  def test_recognize_two
    text = <<-NUMBER.chomp
 _
 _|
|_

    NUMBER
    assert_equal '2', OCR.new(text).convert
  end

  def test_recognize_three
    text = <<-NUMBER.chomp
 _
 _|
 _|

    NUMBER
    assert_equal '3', OCR.new(text).convert
  end

  def test_recognize_four
    text = <<-NUMBER.chomp

|_|
  |

    NUMBER
    assert_equal '4', OCR.new(text).convert
  end

  def test_recognize_five
    text = <<-NUMBER.chomp
 _
|_
 _|

    NUMBER
    assert_equal '5', OCR.new(text).convert
  end

  def test_recognize_six
    text = <<-NUMBER.chomp
 _
|_
|_|

    NUMBER
    assert_equal '6', OCR.new(text).convert
  end

  def test_recognize_seven
    text = <<-NUMBER.chomp
 _
  |
  |

    NUMBER
    assert_equal '7', OCR.new(text).convert
  end

  def test_recognize_eight
    text = <<-NUMBER.chomp
 _
|_|
|_|

    NUMBER
    test = OCR.new(text)
    assert_equal '8', OCR.new(text).convert
  end

  def test_recognize_nine
    text = <<-NUMBER.chomp
 _
|_|
 _|

    NUMBER
    assert_equal '9', OCR.new(text).convert
  end

  def test_identify_garble
    skip
    text = <<-NUMBER.chomp

| |
| |

    NUMBER
    assert_equal '?', OCR.new(text).convert
  end

  def test_identify_10
    text = <<-NUMBER.chomp
    _
  || |
  ||_|

    NUMBER
    assert_equal '10', OCR.new(text).convert
  end

  def test_identify_110101100
    skip
    text = <<-NUMBER.chomp
       _     _        _  _
  |  || |  || |  |  || || |
  |  ||_|  ||_|  |  ||_||_|

    NUMBER
    assert_equal '110101100', OCR.new(text).convert
  end

  def test_identify_with_garble
    skip
    text = <<-NUMBER.chomp
       _     _           _
  |  || |  || |     || || |
  |  | _|  ||_|  |  ||_||_|

    NUMBER
    assert_equal '11?10?1?0', OCR.new(text).convert
  end

  def test_identify_1234567890
    skip
    text = <<-NUMBER.chomp
    _  _     _  _  _  _  _  _
  | _| _||_||_ |_   ||_||_|| |
  ||_  _|  | _||_|  ||_| _||_|

    NUMBER
    assert_equal '1234567890', OCR.new(text).convert
  end

  def test_identify_123_456_789 # rubocop:disable Metrics/MethodLength
    skip
    text = <<-NUMBER.chomp
    _  _
  | _| _|
  ||_  _|

    _  _
|_||_ |_
  | _||_|


 _  _  _
  ||_||_|
  ||_| _|

NUMBER
    assert_equal '123,456,789', OCR.new(text).convert
  end
end