require_relative 'happy_number.rb'

# usage example

puts 'Enter the number: '

begin
  number = Integer(gets)
  raise if number < 0
rescue Exception
  puts 'Invalid value. Try again'
  retry
end

puts format(
  'Is the number %s happy? %s',
  number,
  HappyNumber.number_is_happy?(number).to_s.upcase
)