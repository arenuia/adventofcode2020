forms = File.read("puzzle6/input-puzzle6.txt").chomp.split("\n\n")

def group_response_p1(form)
  ques_affirm = []
  form.split("\n").each do |person|
    person.each_char do |a|
      ques_affirm.push(a) unless ques_affirm.include?(a)
    end
  end
  ques_affirm.count
end

def group_response_p2(form)
  ques_affirm = []
  full_ans = form.each_char
  num_people = form.split.length
  full_ans.each do |a|
    if full_ans.count(a) >= num_people
      ques_affirm.push(a) unless ques_affirm.include?(a)
    end
  end
  ques_affirm.count
end

puts forms.map{ |x| group_response_p1(x) }.sum
puts forms.map{ |x| group_response_p2(x) }.sum

# Another person's solution for verification
# require 'set'

# input = File.read("puzzle6/input-puzzle6.txt")
# groups = input.split("\n\n").map { |group| group.split.map { |a| Set.new(a.chars) } }

# puts '='*20
# puts 'part 1'
# puts groups.map { |g| g.inject(:|).size }.sum

# puts '='*20
# puts 'part 2'
# puts groups.map { |g| g.inject(:&).size }.sum