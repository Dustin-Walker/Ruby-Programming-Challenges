def isPalindrome?(string)
  if string == string.reverse
    true
  else
    false
  end
end

File.open("sample1.txt", "r") do |f|
  fullString = ""
  f.take(1)
  f.each_line do |line|
    fullString << line.chomp.gsub!(/[\W]/, '').to_s
  end
  fullString.downcase!
#  This approach repeatedly compares over the first and last characters of the string.
#  This approach should be slightly faster since it does not necessarily have to manipulate the entire string.
#  stringArray = fullString.downcase!.chars
#  isPalindrome = true
#  ((fullString.size)/2).times do
#    if stringArray.shift != stringArray.pop
#      p "Not a palindrome"
#      isPalindrome = false
#      break
#    end
#  end
#  if isPalindrome
#    p "File contains a palindrome"
#  end
  if isPalindrome?(fullString)
    p "File contains a palindrome"
  else
    p "File does not contain a palindrome"
  end
end
