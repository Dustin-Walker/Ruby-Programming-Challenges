f = File.new("sampleInput.txt", "r")
lineArray = f.readlines
timeData = Hash.new
lineArray.each do |line|
  if(!line.include? ":")
    next #Skip the first line
  else
    data = line.split(":")
    timeData[data[0]] = data[1].chomp.strip.to_f
  end
end
prevx=0
timeData.values.sort.each do |x|
    p timeData.key(x) + ": " +((60-x+prevx).floor).to_s
    prevx = x
end
