def call_me(some_code)
  some_code.call
end

name = "Robert"
code = Proc.new {puts "hi, #{name}"}
name = "Test"

call_me(code)
