class C2
  attr_accessor :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end

  def adjacents
    [C2.new(-1, 0), C2.new(0, -1), C2.new(0, 1), C2.new(1, 0)].map { |a| C2.new(a.x + @x, a.y + @y) }
  end

  def neighbors
    [
      C2.new(-1,-1), C2.new(-1,0), C2.new(-1,1), C2.new(0,-1),
      C2.new(0,1), C2.new(1,-1), C2.new(1,0), C2.new(1,1)
    ].map { |n|
      C2.new(n.x + @x, n.y + @y)
    }
  end

  def +(obj)
    C2.new(obj.x + @x, obj.y + @y)
  end

  def rotateLeft
    tempX = @x
    @x = -@y
    @y = tempX
  end

  def rotateRight
    tempX = @x
    @x = @y
    @y = -tempX
  end
	
	def manhattanDistance
		@x.abs + @y.abs
	end

  def h
    [@x, @y]
  end

  def ==(obj)
    @x == obj.x && @y == obj.y
  end
end
