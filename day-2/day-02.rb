safe_reports = 0;

file_path = File.expand_path("../input.txt", __FILE__)

def difference_greater_than_three(num1, num2)
  (num1 - num2).abs > 3
end

def changes_direction(increasing, num1, num2)
  difference = num1 - num2

  return true if difference < 0 && !increasing
  return true if difference > 0 && increasing

  false
end

def is_safe(nums:)
  i = 0

  increasing = (nums[0].to_i - nums[1].to_i) < 0

  while i < nums.size - 1
    first_num = nums[i].to_i
    second_num = nums[i + 1].to_i

    return false if first_num == second_num || changes_direction(increasing, first_num, second_num) || difference_greater_than_three(first_num, second_num)

    i += 1
  end

  true
end

# Part Two
safe_reports_if_one_removed = 0;

def problem_dampener(nums:)
  (0..nums.size).each do |index|
    n = nums.select.with_index do |_val, i|
      i != index
    end

    if is_safe(nums: n)
      return true
    end
  end

  false
end

input = File.readlines(file_path).each_with_index do |line, i|
  nums = line.split

  safe = is_safe(nums:)

  if safe
    safe_reports += 1
    safe_reports_if_one_removed += 1
  else
    safe_reports_if_one_removed += 1 if problem_dampener(nums:)
  end
end

puts "The number of safe reports is #{safe_reports}"

puts "The number of safe reports if you change a number is #{safe_reports_if_one_removed}"