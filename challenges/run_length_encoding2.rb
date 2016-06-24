class RunLengthEncoding
  def self.encode(str)
    str.scan(/((.)\2*)/)
       .map(&:first)
       .map { |chars| chars.length == 1 ? chars.chr : chars.length.to_s + chars.chr }
       .join
  end

  def self.decode(str)
    str.scan(/\d+\D|\D/)
       .map { |pair| pair.chop.to_i == 0 ? pair[-1] : pair[-1] * pair.chop.to_i }
       .join
  end
end
