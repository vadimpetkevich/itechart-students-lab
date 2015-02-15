class Swapper
  attr_accessor :x, :y

  def initialize(x, y)
    @x, @y = x, y
  end

  # one-line method
  def swap!; @x, @y = @y, @x end
end