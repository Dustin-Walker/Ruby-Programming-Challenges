# https://www.reddit.com/r/dailyprogrammer/comments/3fmke1/20150803_challenge_226_easy_adding_fractions/
# Obtain input data
n = gets.chomp.to_i
fractions = Array.new(n)
n.times do |x|
  fractions[x] = gets.chomp
end
# Calculate the denominator
denominator = 1
numerators = Array.new(n)
denominators = Array.new(n)
index = 0
fractions.each do |fraction|
  # Fraction represented as a/b where a is the numerator and denominator
  numerators[index] = fraction.slice!(/.*\//).slice!(/\d*/).to_i
  denominators[index] = fraction.to_i
  denominator = denominator.lcm(denominators[index])
  index+=1
end
# Calculate the numerator
numerator = 0
n.times do |x|
  numerator += (numerators[x] * denominator / denominators[x]).to_i
end
gdiv = numerator.gcd(denominator)
numerator/=gdiv
denominator/=gdiv
p numerator.to_s<<"/"<<denominator.to_s
