#!/usr/bin/env ruby

instructions = []

File.open("day_1/input.txt") do |f|
  f.each_line { |line| instructions << line.chomp.scan(/^\D|\d+/) }
end

# output a list of positive and negative numbers
instructions.map! do |x| 
  x => [/R|L/i => d, c] # this will error if any other letter appears
  d == "R" ? c.to_i : c.to_i * -1
end

zero_counts = 0
position = 50

instructions.reduce(position) do |position, instruction|
  new_pos = (position + instruction) % 100
  zero_counts += 1 if new_pos == 0
  new_pos
end

puts "zero counts: #{zero_counts}"
