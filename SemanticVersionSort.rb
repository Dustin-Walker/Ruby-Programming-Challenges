class VersionID
	include Comparable
	attr_accessor :major, :minor, :patch, :label
	def <=>(otherVersionID)
		if self.major < otherVersionID.major
			-1
		elsif self.major > otherVersionID.major
			1
		elsif self.minor < otherVersionID.minor
			-1
		elsif self.minor > otherVersionID.minor
			1
		elsif self.patch < otherVersionID.patch
			-1
		elsif self.minor < otherVersionID.minor
			1
		elsif self.label.nil? == false && otherVersionID.label.nil? == true
			-1
		elsif self.label.nil? == true && otherVersionID.label.nil? == false
			1
		else
			0
		end
	end
	def initialize(lineToParse)
		@major = lineToParse.split('.')[0]
		@minor = lineToParse.split('.')[1]
		@patch = lineToParse.split('.')[2].split(/[+-]/)[0]
		if lineToParse.split('.')[2].include? '-'
			@label = lineToParse.split('.')[2].split(/[+-]/)[1]
		end
	end
end

n = gets.chomp
versions = Array.new(n.to_i)
n.to_i.times do |i|
	input = gets.chomp
	versions[i] = VersionID.new(input)
end
versions.sort
versions.reverse!.each {|x| p x.major + '.' + x.minor + '.' + x.patch + '.' + x.label.to_s }