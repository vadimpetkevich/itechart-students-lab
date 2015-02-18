module Sherlock
  N = 5

  def Sherlock.find_suspect(sequence)
    freq = sequence.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
    suspect, suspect_freq = freq.min_by { |n, f| f }
    freq.delete(suspect)
    freq.values.include?(suspect_freq) ? nil : suspect
  end
end

