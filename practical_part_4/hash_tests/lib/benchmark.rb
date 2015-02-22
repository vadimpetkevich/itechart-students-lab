require 'benchmark'
require 'colored'
require_relative 'mur_hash.rb'

Benchmark.bm(40) do |x|
  mur_hash = MurHash.new
  hash = Hash.new
  array = (1..1_000_000).to_a

  puts 'Filling:'.magenta

  x.report('mur_hash:'.cyan) do
    (:key_1..:key_1000000).each_with_index { |key, value| mur_hash[key] = value }
  end

  x.report('hash:'.cyan) do
    (:key_1..:key_1000000).each_with_index { |key, value| hash[key] = value }
  end

  puts 'Access to the values from the beginning:'.magenta

  x.report('mur_hash[:key_555]:'.cyan) { mur_hash[:key_555] }
  x.report('hash[:key_555]:'.cyan) { hash[:key_555] }
  x.report('array.index(555):'.cyan) { array.index(555) }

  puts 'Access to the values from the middle:'.magenta

  x.report('mur_hash[:key_555000]:'.cyan) { mur_hash[:key_555000] }
  x.report('hash[:key_555000]:'.cyan) { hash[:key_555000] }
  x.report('array.index(555000):'.cyan) { array.index(555000) }

  puts 'Access to the values from the end:'.magenta

  x.report('mur_hash[:key_955000]:'.cyan) { mur_hash[:key_955000] }
  x.report('hash[:key_955000]:'.cyan) { hash[:key_955000] }
  x.report('array.index(955000):'.cyan) { array.index(955000) }
end