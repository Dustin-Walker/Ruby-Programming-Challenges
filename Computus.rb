require 'date'
class Computus
	attr_accessor :easterDate
	def easterYearToDate(year)
	    #This is an implementation of the Anonymous Gregorian or
		#Meeus/Jones/Butcher algorithm for determining Easter day.
		#http://en.wikipedia.org/wiki/Computus#Anonymous_Gregorian_algorithm
		a = year.to_i % 19
		b = (year.to_i/100).floor
		c = year.to_i % 100
		d = (b.to_f / 4).floor
		e = b % 4
		f = (( b + 8).to_f / 25).floor
		g = ((b - f + 1).to_f / 3).floor
		h = (19 * a + b - d - g + 15) % 30
		i = (c.to_f / 4).floor
		k = c % 4
		l = (32 + 2 * e + 2 * i - h - k) % 7
		m = ((1 + 11 * h + 22 * l).to_f / 452).floor
		month = ((h + l - 7 * m + 144).to_f / 31).floor
		day = ((h + l - 7 * m + 114) % 31) + 1
		if(day==31)
			month +=1
			day %= 30
		end
		@easterDate = Date.new(year.to_i, month, day)
	end
	def initialize(year)
		easterYearToDate(year)
	end
end

p "Do you want to see the Easter dates for the next ten years?"
input = gets.chomp.downcase
if input=="y" || input=="yes"
	11.times do |x|
		computus = Computus.new(2015 + x)
		p computus.easterDate.to_s
	end
end
p "For which year would you like to learn the date of Easter?"
year = gets.chomp
computus = Computus.new(year)
p computus.easterDate.to_s