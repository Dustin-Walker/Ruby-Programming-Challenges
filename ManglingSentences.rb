# Challenge #220
# https://www.reddit.com/r/dailyprogrammer/comments/3aqvjn/20150622_challenge_220_easy_mangling_sentences/
# This version treats upper-case letters different from lower-case letters.
input = gets.chomp.split
input.each do |word|
  print word.chars.sort.join + " "
end
