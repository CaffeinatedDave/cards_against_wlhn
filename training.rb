require "JSON"

black = JSON.parse(IO.read("black.txt"))

white = []
File.open("white.txt", "r") do |infile|
    while (line = infile.gets)
        white << line.strip
    end
end

while 1
  # pick one black at random
  pickedBlack = black.sample

  # pick 10 whites at random
  pickedWhite = white.sample(10)

  puts "Question:"
  puts pickedBlack["card"]
  puts ""

  puts "Answers:"
  pickedWhite.each_with_index do |c, i|
    puts i.to_s + ": " + c
  end

  puts "x: Nothing's funny here..."
  puts "q: Exit"

  puts ""
  puts "Your answer (0-9):"
  answer = gets.chomp
  if answer == "q"
    exit
  else 
    ratings = pickedBlack['rank']
    ratings.default = 0
    pickedAnswer = answer.to_i
    if answer == "x" 
      pickedAnswer = -9999
    end
    pickedWhite.each_with_index do |c, i|
  	if (i == pickedAnswer) 
        ratings[c] += 1
      else 
        ratings[c] -= 1
      end
    end
  end
  File.open("black.txt", "w") do |f|
    f.write(black.to_json)
  end
end

