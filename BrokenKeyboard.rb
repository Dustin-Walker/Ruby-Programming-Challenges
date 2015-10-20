# https://www.reddit.com/r/dailyprogrammer/comments/3pcb3i/20151019_challenge_237_easy_broken_keyboard/

# Finds the longest word in the dictionary that can be made using only characters from the input
def longestWordUsingChars(input, dictionaryFilePath)
  dict = File.open(dictionaryFilePath).read
  dict.gsub!(/\r\n?/, "\n")
  longest = ""
  pattern = "^[" << input << "]+$" # /^['input']+$/
	regexp = Regexp.new(pattern)
  dict.each_line do |word|
    if(word.length > longest.length)
	    if(word.match(regexp))
		    longest = word.chomp
      end
    end	
  end
  longest
end

input = gets.chomp!
dictionaryFilePath = "enable1.txt"
p longestWordUsingChars(input, dictionaryFilePath)
