input = File.open('input/input01').read.chomp.chars
len = input.length
a1 = 0
a2 = 0

input.each_with_index do |v, i|
  a1 += v.to_i if v == input[(i + 1) % len]
  a2 += v.to_i if v == input[(i + len / 2) % len]
end

puts a1, a2
