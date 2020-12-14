# Puzzle 9

port_output = File.readlines("puzzle9/input-puzzle9.txt").map { |x| x.to_i }
pream_num = 25
part_2_val = 0

### PART 1 ###

port_output.each_with_index do |value, index|
  invalid = true

  if index > pream_num - 1
    preamble = port_output[(index - pream_num..index - 1)]
    preamble.each do |cyph|
      if preamble.include?(value - cyph) && (value - cyph) != cyph
        invalid = false
      end
    end
  else
    invalid = false
  end

  if invalid
    part_2_val = value
    puts "-"*10 + " PART 1 " + "-"*10
    puts value
    break
  end

end

### PART 2 ###

port_output.each_index do |f_index|
  port_output.each_index do |l_index|
    consider = port_output[(f_index..l_index)]
    if consider.sum == part_2_val && consider.first != consider.last
      puts "-"*10 + " PART 2 " + "-"*10
      puts "First: #{consider.first}"
      puts "Last: #{consider.last}"
      puts "Sum: #{consider.first + consider.last}"
    end
  end
end