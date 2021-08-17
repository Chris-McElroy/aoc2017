package main

func day5() {
	jumps := inputInts()
	steps := 0
	i := 0
	for i >= 0 && i < len(jumps) {
		temp := jumps[i]
		jumps[i] += 1
		if temp >= 3 {
			jumps[i] -= 2
		}
		i += temp
		steps += 1
	}

	println(steps)
}
