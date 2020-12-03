tree_rows = File.readlines("puzzle3/input-puzzle3.txt")

def tree_angle(down, right, trees)
  x_axis = 0
  tree_count = 0
  width = trees[0].length - 1 # Accounting for indicies

  trees.each_with_index do |row, index|
    if index % down == 0
      tree_count += 1 unless row[x_axis] != '#'
      x_axis += right
      x_axis = x_axis % width unless x_axis < width
    end
  end
  return tree_count
end

puts tree_angle(1, 1, tree_rows)
puts tree_angle(1, 3, tree_rows)
puts tree_angle(1, 5, tree_rows)
puts tree_angle(1, 7, tree_rows)
puts tree_angle(2, 1, tree_rows)

puts tree_angle(1, 1, tree_rows) * tree_angle(1, 3, tree_rows) * tree_angle(1, 5, tree_rows) * tree_angle(1, 7, tree_rows) * tree_angle(2, 1, tree_rows)
