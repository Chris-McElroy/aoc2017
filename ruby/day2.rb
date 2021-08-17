input = File.open('input/input02').read.chomp.lines
a1 = 0
a2 = 0

input.each do |line|
  vals = line.split.map(&:to_i)
  a1 += vals.max - vals.min

  vals.each do |i|
    vals.each do |j|
      a2 += (i / j) if i > j && (i % j).zero?
    end
  end
end

puts a1, a2
