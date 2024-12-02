#!/usr/bin/env ruby

file_path = File.expand_path("../input.txt", __FILE__)

left_nums = [];
right_nums = [];
count_of_right_nums = Hash.new;
difference = 0;
similarity = 0;

input = File.readlines(file_path).each do |line|
  nums = line.split
  left_nums << nums[0]

  right_num = nums[1]
  right_nums << right_num.to_i
  
  if count_of_right_nums.has_key?(right_num)
    count_of_right_nums[right_num] = count_of_right_nums[right_num] + 1
  else
    count_of_right_nums[right_num] = 1;
  end
end

left_nums = left_nums.sort
right_nums = right_nums.sort

left_nums.each_with_index do |num, index|
  left_num = num.to_i
  right_num = right_nums[index]

  difference = difference + (left_num - right_num).abs

  if (count_of_right_nums.has_key?(num))
    similarity = similarity + (num.to_i * count_of_right_nums[num])
  end  
end

# Part 1 answer
puts "Part 1's answer is #{difference}"

# Part 2 answer
puts "Part 2's answer is #{similarity}"