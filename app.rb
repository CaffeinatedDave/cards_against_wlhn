require "JSON"

black = JSON.parse(IO.read("black.txt"))

white = []
File.open("white.txt", "r") do |infile|
    while (line = infile.gets)
        white << line.strip
    end
end

# pick one black at random
pickedBlack = black.sample
ratings = pickedBlack['rank']
ratings.default = 0

# pick 10 whites at random
pickedWhite = white.sample(10)

puts "Question:"
puts pickedBlack["card"]
puts ""

puts "Options:"
pickedWhite.each_with_index do |c, i|
  puts i.to_s + ": " + c + "(" + ratings[c].to_s + ")"
end

picked = pickedWhite.max_by {|name| ratings[name].to_i}
puts ""
puts "My answer: " + picked
