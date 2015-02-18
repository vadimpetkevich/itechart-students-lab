module Disappeared
  K = 10

  def Disappeared.find_to_missing_numbers(sequence)
    missing_numbers = []

    unless sequence.include?(1)
      sequence << 1
      missing_numbers << 1
    end

    unless sequence.include?(K)
      sequence << K
      missing_numbers << K
    end

    sequence.uniq!
    sequence.sort!

    index = 0
    1.upto(sequence.count - 1) do |next_index|
      interval = sequence[next_index] - sequence[index]
      2.upto(interval) { |offset| missing_numbers << sequence[index] + offset - 1 }
      index = next_index
    end

    missing_numbers.sort!
  end
end
