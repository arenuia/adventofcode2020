# Puzzle 2 for Advent of Code

# Part 1

PASS_REQ = /(\d+)-(\d+) (.): (.+)/

passwords = File.readlines("puzzle2/input-puzzle2.txt")
Password = Struct.new(:low_num, :high_num, :character, :password)
valid_count = 0

passwords.each do |line|
  pass = line.match(PASS_REQ) { |m| Password.new(*m.captures) }
  pass[:low_num] = pass[:low_num].to_i
  pass[:high_num] = pass[:high_num].to_i
  if pass[:password].count(pass[:character]).between?(pass[:low_num], pass[:high_num])
    valid_count += 1
  end
end

puts valid_count
