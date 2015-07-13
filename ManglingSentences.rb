# This version treats upper-case letters different from lower-case letters.
input = gets.chomp.split
input.each do |word|
  word.partition(/\W/).each do |wordPart|
    print wordPart.chars.sort.join
  end
  print " "
end
