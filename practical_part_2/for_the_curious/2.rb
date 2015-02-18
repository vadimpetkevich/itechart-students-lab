10.times { |i| puts i if i == 3 .. i == 5 }

# Conditions (i == 3) and (i == 5) return boolean values.
# So statement (i == 3 .. i == 5) is range literal.
# For various 'i' it will be (false .. false), (true .. false), (false .. true).
# "if" modifier executes code in case the conditional is true.
#
# You can use a Ruby range as a boolean expression.
# A range such as (exp1..exp2) will evaluate as false until exp1 becomes true. The range will then evaluate as true until exp2 becomes true.
# In this case exp1 becomes true in case (i == 3). exp2 becomes true in case (i == 5).
# So range (i == 3 .. i == 5) will evaluate as true in case (i == 3), (i == 4), (i == 5)
#
# Generally, using such literals as (true .. false) or (false .. true) will raise ArgumentError exception, because 'true' and 'false' are objects of different classes.