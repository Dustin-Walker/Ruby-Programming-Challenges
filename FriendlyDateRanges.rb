# TODO Implement intermediate challenge
# reddit.com/r/dailyprogrammer/comments/2ygsxs/20150309_challenge_205_easy_friendly_date_ranges/

require 'date'
CURRENT_YEAR = 2015
monthHash = { 1 => "January", 2 => "February", 3 => "March", 4 => "April", 5 => "May", 6 => "June", 7 => "July", 8 => "August", 9 => "September", 10 => "October", 11 => "November", 12 => "December" }
def dayBuilder(day=0)
	daySuffixHash = { 1 => "st", 2 => "nd", 3 => "rd", 4 => "th", 5 => "th", 6 => "th", 7 => "th", 8 => "th", 9 => "th", 0 => "th" }
	@day = day.to_i
	if @day < 1
		# throw some kind of error
	end
	if @day == 11
		return "11th"
	end
	if @day > 31
		# throw another error
	end
	dayEnd = @day.to_s.slice(@day.to_s.size-1)
	@day.to_s << daySuffixHash[dayEnd.to_i]
end
input = gets.chomp.split(/\s/) # Pattern means "split on white space"
date1 = Date.parse(input[0])
date2 = Date.parse(input[1])
if date2 === date1
	puts "#{monthHash[date1.month]} #{dayBuilder(date1.day)}, #{date1.year}"
elsif date1.month == date2.month && date1.year == date2.year
	puts "#{monthHash[date1.month]} #{dayBuilder(date1.day)} - #{dayBuilder(date2.day)}"
elsif date1.year == CURRENT_YEAR && (date2 - date1).to_i < 365
	puts "#{monthHash[date1.month]} #{dayBuilder(date1.day)} - #{monthHash[date2.month]} #{dayBuilder(date2.day)}"
elsif (date2 - date1).to_i < 365
	puts "#{monthHash[date1.month]} #{dayBuilder(date1.day)} - #{monthHash[date2.month]} #{dayBuilder(date2.day)}, #{date2.year}"
else
	puts "#{monthHash[date1.month]} #{dayBuilder(date1.day)}, #{date1.year} - #{monthHash[date2.month]} #{dayBuilder(date2.day)}, #{date2.year}"
end