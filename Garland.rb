# From: https://www.reddit.com/r/dailyprogrammer/comments/3d4fwj/20150713_challenge_223_easy_garland_words/
# A garland word is one that starts and ends with the same N letters in the same order, for some N greater than 0, but
# less than the length of the word. I'll call the maximum N for which this works the garland word's degree. For
# instance, "onion" is a garland word of degree 2, because its first 2 letters "on" are the same as its last 2 letters.
# Examples
# garland("programmer") -> 0
# garland("ceramic") -> 1
# garland("onion") -> 2
# garland("alfalfa") -> 4
# TODO Find the largest degree of any garland word in the enable1 English word list.
# This method is O(log n) in time complexity
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
userInput = gets.chomp
p garland(userInput).to_s
