package main

import "strconv"

func day8() {
	reg := map[string]int{}

	max1 := 0
	max2 := 0

	for _, line := range wordLines {
		var pos = -1
		if line[1] == "inc" {
			pos = 1
		}
		amt, _ := strconv.Atoi(line[2])
		compVal, _ := strconv.Atoi(line[6])
		switch line[5] {
		case "<":
			if reg[line[4]] < compVal {
				reg[line[0]] += pos * amt
			}
		case ">":
			if reg[line[4]] > compVal {
				reg[line[0]] += pos * amt
			}
		case "<=":
			if reg[line[4]] <= compVal {
				reg[line[0]] += pos * amt
			}
		case ">=":
			if reg[line[4]] >= compVal {
				reg[line[0]] += pos * amt
			}
		case "==":
			if reg[line[4]] == compVal {
				reg[line[0]] += pos * amt
			}
		case "!=":
			if reg[line[4]] != compVal {
				reg[line[0]] += pos * amt
			}
		}
		for _, v := range reg {
			if v > max2 {
				max2 = v
			}
		}
	}

	for _, v := range reg {
		if v > max1 {
			max1 = v
		}
	}
	println(max1, max2)
}
