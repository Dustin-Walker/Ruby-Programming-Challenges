# https://www.reddit.com/r/dailyprogrammer/comments/3pcb3i/20151019_challenge_237_easy_broken_keyboard/

# Finds the longest word in the dictionary that can be made using only characters from the input
def longestWordUsingChars(input, dictionaryFilePath)
  dict = File.open(dictionaryFilePath).read
  dict.gsub!(/\r\n?/, "\n")
  longest = Array.new
  pattern = "^[" << input << "]+$" # /^['input']+$/
	regexp = Regexp.new(pattern)
  dict.each_line do |word|
    if(longest.empty? || word.chomp.size == longest.first.size)
	    if(word.match(regexp))
		    longest.concat(word.chomp.unpack("A*"))
      end
    end
    if(longest.empty? || word.chomp.size > longest.first.size)
	    if(word.match(regexp))
	      longest.clear
		    longest.concat(word.chomp.unpack("A*"))
      end
    end
  end
  longest
end

input = gets.chomp!
dictionaryFilePath = "enable1.txt"
p longestWordUsingChars(input, dictionaryFilePath)
