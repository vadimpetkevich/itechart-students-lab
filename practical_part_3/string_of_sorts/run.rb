require_relative 'string_of_sorts.rb'

# usage_example

puts format(
  'Sorting "%s" by "%s" => "%s"',
  'foos',
  'of',
  StringOfSorts.sort_string('foos', 'of')
)

puts format(
  'Sorting "%s" by "%s" => "%s"',
  'string',
  'gnirts',
  StringOfSorts.sort_string('string', 'gnirts')
)

puts format(
  'Sorting "%s" by "%s" => "%s"',
  'banana',
  'abn',
  StringOfSorts.sort_string('banana', 'abn')
)
