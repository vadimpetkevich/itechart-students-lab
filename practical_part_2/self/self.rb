module Ghost
  def self.boo; end

  class << self
    def hi; end
  end

  def bye; end
end

# This code prints nothing
# We've just defined :boo and :hi methods to Ghost's singleton class and :bye to Ghost module.