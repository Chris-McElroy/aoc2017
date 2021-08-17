package main

func day3() {
	input := intLines[0]

	grid := map[int]map[int]int{0: {0: 1}}

	pos := C2{1, 0}
	dir := C2{0, 1}
	a2 := 0

	for i := 2; i < input; i++ {
		// fmt.Println(i, pos, dir)
		sum := 0
		if a2 == 0 {
			for _, p := range pos.neighbors() {
				sum += grid[p.x][p.y]
			}
			if sum > input {
				a2 = sum
			}
		}
		if _, exists := grid[pos.x]; !exists {
			grid[pos.x] = make(map[int]int)
		}
		grid[pos.x][pos.y] = sum
		pos.add(dir)
		dir.rotateLeft()
		if _, exists := grid[pos.x+dir.x][pos.y+dir.y]; exists {
			dir.rotateRight()
		}
	}

	println(pos.manhattanDistance(), a2)
}
