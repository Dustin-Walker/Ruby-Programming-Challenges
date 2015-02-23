#Math Dice
#http://www.reddit.com/r/dailyprogrammer/comments/2qxrtk/20141231_challenge_195_intermediate_math_dice/

input = gets.chomp.split(' ')
targetNumber = input[0].split('d')[1].to_i
numberOfDice = input[1].split('d')[0].to_i
sizeOfDice = input[1].split('d')[1].to_i
p "target = #{targetNumber}, numberofdice = #{numberOfDice}, sizeOfDice = #{sizeOfDice}."
diceSet = Array.new
prnd = Random.new
numberOfDice.times {diceSet << (prnd.rand(sizeOfDice)+1).to_i }
diceSet.sort!.reverse!
sum=0
diceSet.each do |newDieValue| 
	sum+=newDieValue
	p newDieValue
end
p sum
if(sum<targetNumber)
	p "This set has no solution."
else
	# Look for solutions
	# Re-using sum to reach. This is a greedy approach.
	sum = 0
	diceSet.each do |currentDie|
		if(targetNumber>sum || sum<targetNumber-currentDie)
			p "Sum #{sum} + #{currentDie}"
			sum+=currentDie
		elsif(targetNumber<=sum || sum>targetNumber+currentDie)
			p "Sum #{sum} - #{currentDie}"
			sum-=currentDie
		end
	end
	if(sum==targetNumber)
		p "Valid solution found."
	else
		p "No valid solution found."
	end
end