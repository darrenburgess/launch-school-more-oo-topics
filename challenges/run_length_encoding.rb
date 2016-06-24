class RunLengthEncoding
  def self.encode(input)
    consec_chars = input.scan(/((.)\2*)/).map(&:first)
    consec_chars.map! do |chars|
      chars.length == 1 ? chars.chr : chars.length.to_s + chars.chr
    end
    consec_chars.join
  end

  def self.decode(input)
    encoded_pairs = input.scan(/\d+\D|\D/)
    encoded_pairs.map! do |pair|
      char = pair[-1]
      num = pair.chop.to_i
      num == 0 ? char : char * num
    end
    encoded_pairs.join
  end
end
