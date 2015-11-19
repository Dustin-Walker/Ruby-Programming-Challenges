def typoglycemiaWord(input)
  if input.length <= 3
    input
  end
  letters = input.chars
  last = letters.pop
  first = letters.shift
  letters.shuffle!
  letters << first
  letters.rotate!(-1)
  letters << last
  letters.join
end

def typoglycemiaSentence(input)
  words = input.split(' ')
  words.map! { |x| typoglycemiaWord(x) }
  words.join(" ")
end
