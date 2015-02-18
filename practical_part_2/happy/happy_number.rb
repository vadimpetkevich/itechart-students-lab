module HappyNumber
  def HappyNumber.digits_of_number(number)
    number.to_s.chars.map(&:to_i)
  end

  def HappyNumber.number_is_happy?(number)
    history = []

    loop do
      digits = digits_of_number(number)
      number = digits.map { |digit| digit**2 }.inject(:+)

      return true if number == 1
      return false if history.include?(number)
      history << number
    end
  end
end