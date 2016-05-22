def test(&block)
  puts "whats &block #{block}"
end

test { sleep(1) }
