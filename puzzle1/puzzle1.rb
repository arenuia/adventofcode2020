# Puzzle 1 for Advent of Code

numbers = File.read("puzzle1/input-puzzle1.txt").split.map(&:to_i)

numbers.each do |num|
  if numbers.include? (2020 - num)
    puts "I ain't never seen two pretty numbers:"
    puts num * (2020 - num)
  end
end

numbers.each do |num1|
  numbers.each do |num2|
    if numbers.include? (2020 - num1 - num2)
      puts "Three's a crowd:"
      puts num1 * num2 * (2020 - num1 - num2)
    end
  end
end