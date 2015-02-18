# class Man
#   private

#   def method_missing(name, *args)
#     result = 'drink'
#     3.times { result << fun }
#     result
#   end
# end

# p Man.new.drank

# When you send a message to an object, the object executes called method.
# If it fails to find any such method,
# it raises a NoMethodError exception unless you have provided the object with a method called method_missing.
# There's no method called "drank" here, so method missing is invoked.
# On the method_missing we call "fun" method that is non-existing, so method missing is invoked again.

# Correct code is shown below

class Man
  private

  def method_missing(name, *args)
    result = 'drink'
    args.each { |drink| result << ' ' + drink.to_s }
    result
  end
end

p Man.new.drank('hennessy', 'whiskey')