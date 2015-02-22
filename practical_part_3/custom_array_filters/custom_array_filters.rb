class Array
  Filters = { even: :even?, odd: :odd?, under: :<, over: :> }

  def in_range(range)
    self.select { |e| e.is_a?(Integer) && range === e }
  end

  private
  def method_missing(name, *args)
    super unless Filters[name]
    self.select { |e| e.is_a?(Integer) && e.send(Filters[name], *args) }
  end
end