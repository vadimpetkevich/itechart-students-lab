require_relative 'custom_array_filters.rb'

# usage example

array = [1,2,3,4,5]

puts format('%s.even => %s', array, array.even)
puts format('%s.odd => %s', array, array.odd)
puts format('%s.under(4) => %s', array, array.under(4))
puts format('%s.over(4) => %s', array, array.over(4))
puts format('%s.in_range(1..3) => %s', array, array.in_range(1..3))

puts format(
  '(1..100).to_a.even.in_range(18..30) => %s',
  (1..100).to_a.even.in_range(18..30)
)

puts format(
  %{['a', 1, 'b', 300, 'x', 'q', 63, 122, 181, 'z', 0.83, 0.11].even => %s},
  ['a', 1, 'b', 300, 'x', 'q', 63, 122, 181, 'z', 0.83, 0.11].even
)
