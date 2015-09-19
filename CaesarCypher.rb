def caesarShift(char)
  return (char.ord+3).chr
end

def caesarCypher(word)
  word.chars.map! {|x| caesarShift(x)}
end

input = gets.chomp
p caesarCypher(input)
