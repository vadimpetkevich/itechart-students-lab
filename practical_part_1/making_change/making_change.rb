require_relative 'change'

# usage example

amount = 14
coins = [10, 7 ,2]
puts format(
  'Amount: %s. Coins: %s. Change: %s',
  amount,
  coins,
  Change.make_change(amount, coins)
)

