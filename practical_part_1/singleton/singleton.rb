class Object
  def my_singleton_class
    class << self
      self
    end
  end
end

# usage example

ArrayEngineClass = Array.my_singleton_class # Array's singleton class (eigenclass)

