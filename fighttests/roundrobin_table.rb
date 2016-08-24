#!/usr/bin/env ruby
#

monsters, legend = File.readlines("monsters").map { |line| line.rstrip.split("\t") }.transpose
scores = {}

results=ARGV[0]

File.readlines(results).each do |line|
  champion, champ_score, challenger, chall_score = line.scan(/Fight test .* summary: in 100 fights, (.*) won (\d+) times, (.*) won (\d+) times/).first
  stats = [[champion, champ_score.to_i], [challenger, chall_score.to_i]]
  [0,1].each do |i|
    guy, guy_score = stats.rotate(i)[0]
    other, other_score = stats.rotate(1-i)[0]
    if guy == "jumping bomb"
      guy_score = 100 - other_score
    end
    unless scores[guy]
      scores[guy] = {}
    end
    scores[guy][other] = guy_score
  end
end

puts "Table of fight results:"
puts "\n |#{legend.join("|")}"
puts "-------|#{legend.map {'---'}.join("|")}"
monsters.each_with_index do |monster, monster_index|
  columns = monsters.map do |other|
    scores[monster][other] || "#{legend[monster_index]}"
  end
  puts "#{monster}|#{columns.join("|")}"
end

fights_per_monster = 100 * (monsters.size - 1)
monster_totals = monsters.map {|m| [m, scores[m].values.inject(0) {|sum, score| sum + score}] }.to_h

ranking = monsters.sort { |a, b| monster_totals[a] <=> monster_totals[b] }

puts "\n\nRankings:"

puts "\nmonster|performance|weakest defeater|losses to defeater|strongest defeated|wins to defeated"
puts "-------|-----------|----------------|------------------|------------------|----------------"
ranking.each do |monster|
  percent = monster_totals[monster] * 100 / fights_per_monster
  min_defeater = monsters.inject(monster) do |defeater, other|
    if other != monster && scores[other][monster] > 0 && monster_totals[other] < monster_totals[defeater]
      other
    else
      defeater
    end
  end
  max_defeated = monsters.inject(monster) do |defeated, other|
    if other != monster && scores[monster][other] > 0 && monster_totals[other] > monster_totals[defeated]
      other
    else
      defeated
    end
  end
  puts "#{monster}|#{percent}%|#{min_defeater}|#{scores[min_defeater][monster]}|#{max_defeated}|#{scores[monster][max_defeated]}"
end


