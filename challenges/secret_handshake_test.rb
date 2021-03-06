require 'minitest/autorun'
require 'minitest/reporters'
require_relative 'secret_handshake'
MiniTest::Reporters.use!
system 'clear'

class SecretHandshakeTest < MiniTest::Unit::TestCase
  def test_to_binary
    handshake9 = SecretHandshake.new 9
    assert_equal handshake9.to_binary, '1001'
    handshake100 = SecretHandshake.new 100
    assert_equal handshake100.to_binary, '1100100'
    handshake2 = SecretHandshake.new 2
    assert_equal handshake2.to_binary, '10'
    handshake0 = SecretHandshake.new 0
    assert_equal handshake0.to_binary, '0'
    handshake31 = SecretHandshake.new 31
    assert_equal handshake31.to_binary, '11111'
  end

  def test_handshake_1_to_wink
    handshake = SecretHandshake.new(1)
    assert_equal ['wink'], handshake.commands
  end

  def test_handshake_10_to_double_blink
    handshake = SecretHandshake.new(2)
    assert_equal ['double blink'], handshake.commands
  end

  def test_handshake_100_to_close_your_eyes
    handshake = SecretHandshake.new(4)
    assert_equal ['close your eyes'], handshake.commands
  end

  def test_handshake_1000_to_jump
    handshake = SecretHandshake.new(8)
    assert_equal ['jump'], handshake.commands
  end

  def test_handshake_11_to_wink_and_double_blink
    handshake = SecretHandshake.new(3)
    assert_equal ['wink', 'double blink'], handshake.commands
  end

  def test_handshake_10011_to_double_blink_and_wink
    handshake = SecretHandshake.new(19)
    assert_equal ['double blink', 'wink'], handshake.commands
  end

  def test_handshake_11111_to_double_blink_and_wink
    handshake = SecretHandshake.new(31)
    expected = ['jump', 'close your eyes', 'double blink', 'wink']
    assert_equal expected, handshake.commands
  end

  def test_invalid_handshake
    handshake = SecretHandshake.new('piggies')
    assert_equal [], handshake.commands
  end
end
