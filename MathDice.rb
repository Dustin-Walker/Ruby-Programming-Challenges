#Math Dice
#http://www.reddit.com/r/dailyprogrammer/comments/2qxrtk/20141231_challenge_195_intermediate_math_dice/

puts "Input your dice combination according to NdX NdX."
input = gets.chomp.split(' ')
puts "How many trials do you want to run?"
trials = gets.chomp.to_i
trialResults = Array.new
# Element 0 represents losses, element 1 represents wins
trialResults[0] = 0
trialResults[1] = 0
trials.times do
	prnd = Random.new
	targetArray = Array.new
	input[0].split('d')[0].to_i.times { targetArray << prnd.rand((input[0].split('d')[1].to_i)+1) }
	targetNumber = 1
	targetArray.each { |targetDieValue| targetNumber*=targetDieValue}
	numberOfDice = input[1].split('d')[0].to_i
	sizeOfDice = input[1].split('d')[1].to_i
	puts "Target Value = #{targetNumber}"
	diceSet = Array.new
	numberOfDice.times {diceSet << (prnd.rand(sizeOfDice)+1).to_i }
	sum=0
	print "Dice Values = "
	diceSet.each do |newDieValue| 
		sum+=newDieValue
		print newDieValue.to_s+" "
	end
	diceSet.sort!.reverse!
	stringBuilder = ""
	if(sum<targetNumber)
		puts "\nThis set has no solution."
	else
		# Look for solutions
		# Re-using sum to reach. This is a greedy approach.
		sum = 0
		diceSet.each do |currentDie|
			if(targetNumber>sum || sum<targetNumber-currentDie)
				#p "Sum #{sum} + #{currentDie}"
				stringBuilder << "+" << currentDie.to_s
				sum+=currentDie
			elsif(targetNumber<=sum || sum>targetNumber+currentDie)
				#p "Sum #{sum} - #{currentDie}"
				stringBuilder << "-" << currentDie.to_s
				sum-=currentDie
			end
		end
		if(sum==targetNumber)
			puts "\nValid solution found."
			puts stringBuilder+" = "+targetNumber.to_s
			trialResults[1]+=1
		else
			puts "\nNo valid solution found."
			puts stringBuilder
			trialResults[0]+=1
		end
	end
end
puts "Of the #{trialResults[1]+trialResults[0]} trials, #{trialResults[1]} or  #{(trialResults[1].to_f/(trialResults[1]+trialResults[0]).to_f*100).round}% were wins and #{trialResults[0]} or #{(trialResults[0].to_f/(trialResults[1]+trialResults[0]).to_f*100).round}% were losses."