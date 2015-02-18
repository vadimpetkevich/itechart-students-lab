require_relative 'number_snake.rb'

# usage example

puts 'Enter the dimensions:'

begin
  dimensions = Integer(gets)
  raise if dimensions <= 0
rescue Exception
  puts 'Invalid value. Try again'
  retry
end

class Matrix
  def print
    max_length = self.max.to_s.length + 2
    self.to_a.each do |row|
      puts row.map { |e| e.to_s.center(max_length) }.join
    end
  end
end

square = NumberSnake.fill_square(dimensions)
square.print