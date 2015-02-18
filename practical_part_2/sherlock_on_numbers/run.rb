require_relative 'sherlock.rb'

# usage example

sequence = Array.new(Sherlock::N) { Random.rand(0..Sherlock::N) }
puts "Sequence: #{sequence}"

suspect = Sherlock.find_suspect(sequence)
if suspect
  puts "Suspect's number is #{suspect}"
else
  puts "There isn't a suspect in the sequence"
end