include Math
number = 1
1000.times do
  number = cos(number)
end
p "The Dottie number is #{number}"

number = 2
1000.times do
  number = number - tan(number)
end
p "Starting with 2 and computing f(X) = X - tan(X) 1000 times yields #{number}"

number = 2.0
1000.times do
  number = 1 + 1/number
end
p "Starting with 1 and computing f(X) = 1 + 1/X 1000 times yields #{number}"

number = 0.5
1000.times do
  number = 4*number*(1-number)
end
p "Starting with 0.5 and computing f(X) = 4X(1-X) 1000 times yields #{number}"
