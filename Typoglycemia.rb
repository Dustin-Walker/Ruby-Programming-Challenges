# https://www.reddit.com/r/dailyprogrammer/comments/3s4nyq/20151109_challenge_240_easy_typoglycemia/

# Mixes up the characters in a word except for the first and last ones.
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

# Runs typoglycemia on an entire sentence or paragraph of text by running it on each word and joining them all together
def typoglycemiaSentence(input)
  words = input.split(' ')
  words.map! { |x| typoglycemiaWord(x) }
  words.join(" ")
end
