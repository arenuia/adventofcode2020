# Puzzle 1 for Advent of Code

numbers = File.read("input-puzzle1.txt").split.map(&:to_i)

numbers.each do |num|
  if numbers.include? (2020 - num)
    puts num * (2020 - num)
  end
end