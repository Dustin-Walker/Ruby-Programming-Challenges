File.open("macbeth.txt") do |f|
	dialogSet = Hash.new
	counter = 0
	while line = f.gets
		if line =~ /^\s{4}/ #Pattern means "begins with 4 space characters"
			if dialogSet[counter].nil?
				dialogSet[counter] = line
			else
				dialogSet[counter] << line
			end
		elsif !(dialogSet[counter].nil?)
			counter+=1
		end
	end
	userInput = gets.chomp
	dialogSet.each_value do |value|
		if value.include? userInput
			puts value
		end
	end
end