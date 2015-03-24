# http://www.reddit.com/r/dailyprogrammer/comments/2zyipu/20150323_challenge_207_easy_bioinformatics_1_dna/
dnaPairs = { 'A' => 'T', 'T' => 'A', 'C' => 'G', 'G' => 'C' }
inputLine = gets.chomp.delete(" ")
inputLine.each_char { |c| print dnaPairs[c].to_s + " " }
puts ""
