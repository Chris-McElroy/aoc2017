package main

func day4() {
	validCount := 0

	for _, line := range wordLines {
		words := stringSet{map[string]struct{}{}}
		for i, word := range line {
			if !words.insert(SortString(word)) {
				break
			} else if i == len(line)-1 {
				validCount += 1
			}
		}
	}

	println(validCount)
}
