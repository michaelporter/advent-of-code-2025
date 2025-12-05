#!/usr/bin/env ruby

instructions = []
zero_counts = 0

File.open("day_1/input.txt") do |f|
  # collect the lines as two value arrays using #scan to
  # grab the non-digit value first, and then all digit values
  # ex: [["R", 10], ["L", 83], ...]
  f.each_line { |line| instructions << line.chomp.scan(/^\D|\d+/) }
end

# output a list of positive and negative numbers
instructions.map! { |x| 
  x => [/R|L/i => d, c] # this will error if any other letter appears
  d == "R" ? c.to_i : c.to_i * -1
}.reduce(50) { |position, instruction|
  new_pos = (position + instruction) % 100
  turns, notches_rem = instruction.abs.divmod(100)

  zero_counts += turns
  zero_counts += 1 if instruction.positive? && position + notches_rem > 100
  zero_counts += 1 if instruction.negative? && position != 0 && notches_rem > position
  zero_counts += 1 if new_pos == 0
  
  new_pos
}

puts "zero counts: #{zero_counts}"