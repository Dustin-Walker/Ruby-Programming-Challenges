# https://www.reddit.com/r/dailyprogrammer/comments/3jz8tt/20150907_challenge_213_easy_cellular_automata/

def rule90(input)
  # rule90 uses XOR on a value's neighbors to create a new value
  if input.is_a? String
      input = input.chars
  end
  size = input.size
  result = Array.new(size)
  display = Array.new(size)
  size.times do |x|
    # left case
    if x == 0
      # left case
      result[0] = input[1].to_i
    else 
       if x == input.size-1
        # right case
        result[size-1] = input[size-2].to_i
      else
        # main case
        result[x] = input[x-1].to_i ^ input[x+1].to_i
      end
    end
  if result[x] == 1
    display[x] = "*"
  else
    display[x] = " "
  end
  end
  p display.join
  # p result.join.to_i(2)
  result
end

def rule30(input)
  # https://en.wikipedia.org/wiki/Rule_30
    # rule90 uses XOR on a value's neighbors to create a new value
  if input.is_a? String
      input = input.chars
  end
  size = input.size
  result = Array.new(size)
  display = Array.new(size)
  size.times do |x|
    # left case
    if x == 0
      # left case
      result[0] = input[1].to_i
    else 
       if x == input.size-1
        # right case
        result[size-1] = input[size-2].to_i
      else
        result[x] = rule30helper(input[x-1..x+1].join).to_i
      end
    end
  if result[x] == 1
    display[x] = "*"
  else
    display[x] = " "
  end
  end
  p display.join
  # p result.join.to_i(2)
  result
end

def rule30helper(cell)
  case cell
    when "111"
      0
    when "110"
      0
    when "101"
      0
    when "100"
      1
    when "011"
      1
    when "010"
      1
    when "001"
      1
    when "000"
      0
  end
end

input = "000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000"
25.times do
  input = rule30(input)
end
p input.join.to_i(2)
