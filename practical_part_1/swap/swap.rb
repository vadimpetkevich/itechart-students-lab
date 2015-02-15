require_relative 'swapper'

# usage example

swapper = Swapper.new(5, 10)
puts format('x: %s, y: %s', swapper.x, swapper.y)

puts 'SWAP!'
swapper.swap!
puts format('x: %s, y: %s', swapper.x, swapper.y)