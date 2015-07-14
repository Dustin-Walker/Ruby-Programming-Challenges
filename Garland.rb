# From: https://www.reddit.com/r/dailyprogrammer/comments/3d4fwj/20150713_challenge_223_easy_garland_words/
# A garland word is one that starts and ends with the same N letters in the same order, for some N greater than 0, but
# less than the length of the word.
# This method is O(log n) in time complexity.
# This method returns the value N as described above.
def garland(input) 
  inputLength = input.length
  ((inputLength/2)+1).times do |x|
    #headString = input[0, (inputLength/2+1)-x]
    #tailString = input[inputLength/2+x, inputLength]
    if input[0, (inputLength/2+1)-x] == input[inputLength/2+x, inputLength]
      return inputLength/2+1-x
    end
  end
  0 # return here when string has garland-degree of 0
end

# Find the largest degree of any garland word in the enable1 English word list.
# Answer: undergrounder with a garland degree of 5
fileName = "enable1.txt"
dictionary = open(fileName)
highestGarlandDegree = 4
highestGarlandWord = "alfalfa"
IO.foreach(fileName) do |word|
  word.chomp!
  if garland(word) > highestGarlandDegree
    highestGarlandDegree = garland(word)
    highestGarlandWord = word
  end
end

p highestGarlandWord
p highestGarlandDegree
