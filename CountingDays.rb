require 'date'

p "When is your event taking place?"
input = gets.chomp.split(' ')
deltaTime = (Date.new(input[0].to_i, input[1].to_i, input[2].to_i)-Date.today).to_i
p "The date you entered is #{deltaTime} days away from today."