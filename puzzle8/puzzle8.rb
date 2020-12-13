# Puzzle 8

boot = File.readlines("puzzle8/input-puzzle8.txt")

nop_jmp_lines = []

boot.each_with_index do |value, index|
  if value.include?('jmp') || value.include?('nop')
    nop_jmp_lines.push(index)
  end
end

nop_jmp_lines.each do |switch|
  
  process_line = 0
  accumulator = 0
  visited_lines = []
  booting = true

  while booting
    if process_line == boot.length - 1
      puts "Last line!!!!!!!!!!!!! ACC is #{accumulator}"
      booting = false
    elsif visited_lines.include?(process_line)
      ## puts "Part 1. ACC is #{accumulator}."
      booting = false
    else
      visited_lines.push(process_line)
      command, operation = boot[process_line].split
      operation = operation.to_i

      if process_line == switch && command == 'jmp'
        command = 'nop'
      elsif process_line == switch && command == 'nop'
        command = 'jmp'
      end

      if command == 'acc'
        accumulator += operation
        process_line += 1
      elsif command == 'jmp'
        process_line += operation
      else
        process_line += 1
      end

    end
  end
end