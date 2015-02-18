require_relative 'disappeared.rb'

# usage example

sequence = Array.new(Disappeared::K) { Random.rand(1..Disappeared::K) }
puts format('Original sequence: %s', sequence)

missing_numbers = Disappeared.find_to_missing_numbers(sequence)
puts format('Missing numbers: %s', missing_numbers)
