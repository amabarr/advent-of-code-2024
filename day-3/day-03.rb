file_path = File.expand_path("../input.txt", __FILE__)

file = File.read(file_path)

matches = file.scan(/(mul\(\d{1,3},\d{1,3}\))|(don't)|(do\(\))/)

sum = 0
sum_when_allowed = 0
add = true


matches.flatten.compact.each do |str|
  has_mul = str.match("mul")

  if has_mul.nil?
    # check if it's do or don't
    do_not = str.match("don't")

    add = !do_not
  else
    mul = str.scan(/\d{1,3}/).map(&:to_i).inject(:*)
    sum += mul
    sum_when_allowed += mul if add
  end
end

# Part 1 answer
puts "Part 1 answer is #{sum}"

# Part 2 answer
puts "Part 2 answer is #{sum_when_allowed}"