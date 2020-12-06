NUM_ROWS = 128
NUM_COLS = 8

passes = File.readlines("puzzle5/input-puzzle5.txt")

def pass_to_seat(pass)
  row_part = NUM_ROWS
  col_part = NUM_COLS
  row_start = 0
  row_end = NUM_ROWS - 1
  col_start = 0
  col_end = NUM_COLS - 1

  row_ins, col_ins = pass.match(/(.{7})(.{3})/).captures

  row_ins.each_char do |i|
    row_part /= 2

    if i == "F"
      row_end -= row_part
    else
      row_start += row_part
    end
    
  end

  row_num = row_start

  col_ins.each_char do |j|
    col_part /= 2

    if j == "L"
      col_end -= col_part
    else
      col_start += col_part
    end

  end

  col_num = col_start

  seat_id = row_num * 8 + col_num

end

seat_ids = passes.map{ |x| pass_to_seat(x) }
seat_poss = (seat_ids.min..seat_ids.max).to_a

puts "Part 1: " + seat_ids.max.to_s
puts "Part 2: " + (seat_poss - seat_ids)[0].to_s
