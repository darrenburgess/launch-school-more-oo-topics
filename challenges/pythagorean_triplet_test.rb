require 'minitest/autorun'
require 'minitest/reporters'
require_relative 'pythagorean_triplet'
require 'pry'
MiniTest::Reporters.use!
system 'clear'

class TripletTest < MiniTest::Unit::TestCase
  def test_sum
    assert_equal 12, Triplet.new(3, 4, 5).sum
  end

  def test_product
    assert_equal 60, Triplet.new(3, 4, 5).product
  end

  def test_pythagorean
    assert Triplet.new(3, 4, 5).pythagorean?
  end

  def test_not_pythagorean
    assert !Triplet.new(5, 6, 7).pythagorean?
  end

  def test_out_of_order
    assert Triplet.new(5,4,3).pythagorean?
  end

  def test_out_of_order2
    assert Triplet.new(3, 5, 4).pythagorean?
  end

  def test_triplets_upto_10
    triplets = Triplet.where(max_factor: 10)
    products = triplets.map(&:product).sort
    assert_equal [60, 480], products
  end

  def test_triplets_from_11_upto_20
    triplets = Triplet.where(min_factor: 11, max_factor: 20)
    products = triplets.map(&:product).sort
    assert_equal [3840], products
  end

  def test_triplets_where_sum_x
    triplets = Triplet.where(sum: 180, max_factor: 100)
    products = triplets.map(&:product).sort
    assert_equal [118_080, 168_480, 202_500], products
  end
end
