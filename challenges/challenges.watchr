require 'watchr'
watch( '(.*)\.rb') {|md| system("ruby test_#{md[1]}.rb")}
