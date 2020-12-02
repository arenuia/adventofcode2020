# Puzzle 2 for Advent of Code

PASS_REQ = /(\d+)-(\d+) (.): (.+)/

passwords = File.readlines("puzzle2/input-puzzle2.txt")
Password = Struct.new(:low_num, :high_num, :character, :password)
valid_count_p1 = 0
valid_count_p2 = 0

passwords.each do |line|

  # Part 1

  pass = line.match(PASS_REQ) { |m| Password.new(*m.captures) }
  pass[:low_num] = pass[:low_num].to_i
  pass[:high_num] = pass[:high_num].to_i
  if pass[:password].count(pass[:character]).between?(pass[:low_num], pass[:high_num])
    valid_count_p1 += 1
  end

  # Part 2

  char_1 = pass[:password][pass[:low_num] - 1] == pass[:character]
  char_2 = pass[:password][pass[:high_num] - 1] == pass[:character]
  if char_1 && char_2
    false
  elsif !char_1 && !char_2
    false
  else
    valid_count_p2 += 1
  end
  
end

puts valid_count_p1
puts valid_count_p2
