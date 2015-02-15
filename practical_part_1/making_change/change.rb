module Change
  def self.validate?(amount, coins)
    begin
      return if Integer(amount) < 0
      coins.each { |coin| return false unless Integer(coin) > 0 }
    rescue Exception
      return false
    end
    return if coins.empty?
    true
  end

  def self.optimal_change(combinations)
    return if combinations.empty?

    count = []
    combinations.each do |change|
      count << change.values.inject(:+)
    end

    min_count_index = count.index(count.min)
    change = []
    combinations[min_count_index].each_pair do |key, value|
      value.times { change << key }
    end

    change
  end

  def self.make_change(amount, coins)
    return unless validate?(amount, coins)
    coins.uniq!

    change = Hash.new
    combinations = []

    get_combinations_proc = Proc.new do |amount, coins|
      coin = coins.first
      max_count = amount / coin

      max_count.downto(0) do |count|
        remaining = amount - coin * count
        change[coin] = count

        if coins.count == 1
          next unless remaining.zero?
          combinations << change.clone
          break
        else
          get_combinations_proc.call(remaining, coins[1..-1])
        end
      end
    end
    get_combinations_proc.call(amount, coins)
    self.optimal_change(combinations)
  end
end
