class Sieve
  def initialize(max)
    @max = max
    @numbers = Array 2..@max
  end

  def primes
    @numbers.each_with_index do |number, index|
      min_index = index + 1
      max_index = @numbers.size - 1
      (min_index..max_index).to_a.each_index do |i|
        @numbers.delete(number * (i + 2))
      end
      max_index = @numbers.size - 1
    end
  end
end
