require 'pry'

class Phrase
  attr_reader :words

  def initialize(words)
    @words = words
  end

  def word_count
    counts = {}
    wordz = words.downcase.gsub(/[^\dA-Za-z ']/, ' ')
    wordz = wordz.split(' ')
    wordz.each do |word|
      word.gsub!(/[^\dA-z']/)
      word.gsub!(/^[']|[']$/, '')
      if counts[word]
        counts[word] += 1
      else
        counts[word] = 1
      end
    end

    counts
  end
end
