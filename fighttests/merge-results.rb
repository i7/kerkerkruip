#!/usr/bin/env ruby
#

result_files = ARGV
require 'set'

results = {}
result_files.each do |file|
  File.readlines(file).each do |line|
    champion, champ_score, challenger, chall_score = line.scan(/Fight test .* summary: in 100 fights, (.*) won (\d+) times, (.*) won (\d+) times/).first
    pair = Set.new([champion, challenger])
    results[pair] = line
  end
end

results.values.each do |result|
  puts result
end

