input = gets.chomp.split(' ')
val1 = ""
val2 = ""
(32 -(input[0].to_i.to_s(2).length)).times { val1 << "0" }
val1 << input[0].to_i.to_s(2)
(32-(input[1].to_i.to_s(2).length)).times { val2 << "0" }
c1 = (input[0].to_i ^ input[1].to_i).to_s(2).count "0"
p (((32 - ((input[0].to_i ^ input[1].to_i).to_s(2).length))+c1).to_f / 32.0 * 100).floor.to_s + "% Compatibility"
