# http://www.reddit.com/r/dailyprogrammer/comments/2z68di/20150316_challenge_206_easy_recurrence_relations/

# This is an iterative approach using lambdas.
def recurrence_relation(startingValue, args, iterations)
  stringBuilder = ""
  args.each do |x|
   stringBuilder << x << ')'
  end
  
  stringPrefix = ""
  args.size.times do
    stringPrefix << '('
  end
  
  rr = ->(inputValue) { return (stringPrefix + inputValue + stringBuilder) }
  
  current_value = startingValue
  p current_value.to_i
  iterations.to_i.times do
    current_value = rr.call(current_value)
    p eval(current_value)
  end
end

relation = gets.chomp.split(/\s/)
startingValue = gets.chomp
iterations = gets.chomp

recurrence_relation(startingValue, relation, iterations)
