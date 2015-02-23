#Math Dice
#http://www.reddit.com/r/dailyprogrammer/comments/2qxrtk/20141231_challenge_195_intermediate_math_dice/

input = gets.chomp.split(' ')
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
	else
		puts "\nNo valid solution found."
		puts stringBuilder
	end
end