#!/usr/bin/env ruby
#
# https://adventofcode.com/2025/day/2

id_ranges = File.read("day_2/input.txt").split(",").map do |ids|
  start, finish = ids.split("-").map(&:to_i)
  Range.new(start, finish)
end

collected_invalid_ids = id_ranges.reduce([]) do |invalid_ids, range|
  invalid_ids << range.reduce([]) do |flagged_ids, id|
    next flagged_ids if id < 10
    sid = id.to_s
    next flagged_ids if sid.length.odd?

    halves = sid.chars.each_slice(sid.length / 2).map(&:join)

    flagged_ids.push(id) if halves.uniq.count == 1
    flagged_ids
  end
end.flatten

puts collected_invalid_ids.sum

