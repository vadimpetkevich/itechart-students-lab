def jerseys_sum
  ARGV.map(&:to_i).inject(:+) || 0
end