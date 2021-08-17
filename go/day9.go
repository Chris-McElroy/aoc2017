package main

func day9() {
	depth := 0
	score := 0
	inGarbage := false
	ignoreNext := false
	co := 0

	for _, c := range input[0] {
		if ignoreNext {
			ignoreNext = false
			continue
		}
		if !inGarbage {
			if c == '{' {
				depth += 1
				score += depth
			} else if c == '}' {
				depth -= 1
			} else if c == '<' {
				inGarbage = true
			}
		} else {
			if c == '!' {
				ignoreNext = true
			} else if c == '>' {
				inGarbage = false
			} else {
				co += 1
			}
		}
	}

	println(score, co)

}
