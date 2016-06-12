require 'pry'

class Phrase
  attr_reader :phrase

  def initialize(phrase)
    @phrase = phrase
  end

  def word_count
    counts = Hash.new(0)

    words = phrase.downcase
                 .gsub(/[^\dA-Za-z ']/, ' ')
                 .split(' ')

    words.each do |word|
      word.gsub!(/[^\dA-z']|^['"]|['"]$/, '')
      counts[word] += 1
    end

    counts
  end
end
