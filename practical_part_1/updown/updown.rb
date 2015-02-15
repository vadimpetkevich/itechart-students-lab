(1..100).each do |number|
  if number % 3 == 0
    puts number % 5 == 0 ? 'UpDown' : 'Up'
  else
    puts number % 5 == 0 ? 'Down' : number
  end
end