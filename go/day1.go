package main

func day1() {
	input := input[0]
	doubled := input + input
	sum := 0

	for i, c := range input {
		if input[i] == doubled[i+len(input)/2] {
			sum += int(c - '0')
		}
	}

	println(sum)
}
