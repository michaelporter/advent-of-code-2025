#!/usr/bin/env ruby
#
# https://adventofcode.com/2025/day/2#part2


id_ranges = File.read("day_2/input.txt").split(",").map do |ids|
  start, finish = ids.split("-").map(&:to_i)
  Range.new(start, finish)
end

collected_invalid_ids = id_ranges.reduce([]) do |invalid_ids, range|
  invalid_ids << range.reduce([]) do |flagged_ids, id|
    next flagged_ids if id < 10
    sid = id.to_s
    
    found_invalid = false
  
    dividers = (1..sid.length/2).sort {|x,y| y <=> x}
    dividers.each do |x|
      next if sid.length % x != 0

      chunks = sid.chars.each_slice(x).map(&:join)
      if chunks.uniq.length == 1
        found_invalid = true
        break
      end
    end

    flagged_ids << id if found_invalid
    flagged_ids
  end
end.flatten

puts collected_invalid_ids.sum
