require 'pry'

class Phrase
  attr_reader :words

  def initialize(words)
    @words = words
  end

  def word_count
    counts = Hash.new(0)
    wordz = words.downcase
                 .gsub(/[^\dA-Za-z ']/, ' ')
                 .split(' ')
    wordz.each do |word|
      word.gsub!(/[^\dA-z']|^['"]|['"]$/, '')
      counts[word] += 1
    end

    counts
  end
end
