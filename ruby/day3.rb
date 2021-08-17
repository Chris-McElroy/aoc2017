require "./helpers"

input = File.open('input/input03').read.chomp.to_i

grid = Hash.new(0)
grid[C2.new(0, 0).h] = 1
pos = C2.new(1, 0)
dir = C2.new(0, 1)
a2 = 0

(input - 2).times do
  sum = 0
  if a2.zero?
    pos.neighbors.each { |p| sum += grid[p.h] }
    a2 = sum if sum > input
  end
  grid[pos.h] = sum
  pos += dir
  dir.rotateLeft
  dir.rotateRight if grid.key?((pos + dir).h)
end

puts pos.manhattanDistance, a2
