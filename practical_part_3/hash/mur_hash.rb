require 'murmurhash3'
require 'prime.rb'

class MurHash
  MAX_DENSITY = 5
  Pair = Struct.new(:key, :value)

  attr_reader :default, :keys, :values

  def initialize(default = nil)
    @default = default
    recompute_size
    @table = Array.new(@table_size)
    @keys, @values = [], []
  end

  def []=(key, value)
    location = determine_location(key)

    if @table[location]
      same_key = @table[location].find_index { |pair| pair.key == key }
      if same_key
        old_value = @table[location][same_key].value
        @values.delete(old_value)
        @table[location][same_key].value = value
      else
        @table[location] << Pair.new(key, value)
        @keys << key
      end
    else
      @table[location] = [Pair.new(key, value)]
      @keys << key
    end

    @values << value
  end

  def [](key)
    location = determine_location(key)

    return @default unless @table[location]
    index = @table[location].find_index { |pair| pair.key == key }
    index ? @table[location][index].value : @default
  end

  def clear
    @table.fill(nil)
    @keys.clear
    @values.clear
  end

  def empty?
    @keys.count == 0
  end

  def size
    @keys.count
  end

  private
  def recompute_size
    power_of_two = @table_size ? Math.log2(@table_size).to_i : 20
    @table_size = 2**(power_of_two + 1)
    @table_size += 1 until Prime.prime?(@table_size)
  end
  def determine_location(key)
    hash = MurmurHash3::V32.str_hash(key.to_s)
    location = hash % @table_size
  end
end