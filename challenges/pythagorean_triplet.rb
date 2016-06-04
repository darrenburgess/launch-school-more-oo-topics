require 'pry'

class Triplet
  def initialize(leg1, leg2, leg3)
    @leg1 = leg1
    @leg2 = leg2
    @leg3 = leg3
  end

  def sum
    @leg1 + @leg2 + @leg3
  end

  def product
    @leg1 * @leg2 * @leg3
  end

  def pythagorean?
    if @leg1 > @leg2 && @leg1 > @leg3
      @leg2 ** 2 + @leg3 ** 2 == @leg1 ** 2
    elsif @leg2 > @leg3 && @leg2 > @leg1
      @leg1 ** 2 + @leg3 ** 2 == @leg2 ** 2
    else
      @leg1 ** 2 + @leg2 ** 2 == @leg3 ** 2
    end
  end

  def self.where(factors)
    max_factor = factors.fetch(:max_factor)
    min_factor = factors.fetch(:min_factor, 1)
    sum        = factors.fetch(:sum, 0)
    min_factor = 3 if min_factor < 3
    result = []

    min_factor.upto max_factor  do |a|  
      (a+1).upto max_factor do |b|
        (b+1).upto max_factor do |c|
          triplet = Triplet.new a, b, c
          if sum > 0
            result << triplet if triplet.pythagorean? && triplet.sum == sum
          else
            result << triplet if triplet.pythagorean?
          end
        end
      end
    end

    result
  end
end

triangle = Triplet.new(4, 5, 3)

p triangle.sum
p triangle.product
p triangle.pythagorean?
