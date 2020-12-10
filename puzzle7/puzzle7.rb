require 'set'

luggage = File.readlines("puzzle7/input-puzzle7.txt")

# Format of rules:
# [TYPE COLOR] bags contain ([NUMBER] [TYPE COLOR] bags,)+ .

### PART 1 ###
puts "="*10 + " Part 1 " + "="*10
child_bags = Hash.new { |hash, key| hash[key] = Array.new }

luggage.each do |rule|
  parent, contain = rule.match(/(.+) bags contain (.+)\./).captures
  children = contain.split(", ")
  children.each do |child|
    if child != "no other bags"
      bag_type = child.match(/(\d+) (.+) bag/).captures[1]
      child_bags[bag_type].push(parent)
    end
  end
end

bag_colors = Set.new
queue = ["shiny gold"]

while queue.any?
  color = queue.shift
  child_bags[color].each do |bag|
    bag_colors.add(bag)
    queue.push(bag)
  end
end

puts bag_colors.size


### PART 2 ###
puts "="*10 + " Part 2 " + "="*10
parent_bags = Hash.new { |hash, key| hash[key] = Array.new }

luggage.each do |rule|
  parent, contain = rule.match(/(.+) bags contain (.+)\./).captures
  children = contain.split(", ")
  children.each do |child|
    if child != "no other bags"
      number, bag_type = child.match(/(\d+) (.+) bag/).captures
      parent_bags[parent].push([bag_type,number.to_i])
    end
  end
end

sum = 0
queue = [["shiny gold", 1]]

while queue.any?
  parent, parent_num = queue.shift
  parent_bags[parent].each do |child, child_num|
    sum += parent_num * child_num
    queue.push([child, parent_num * child_num])
  end
end

puts sum 