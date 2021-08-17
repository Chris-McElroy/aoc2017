package main

import (
	"strconv"
	"strings"
)

func day2() {
	a1 := 0

	for _, line := range input {
		max := 0
		min := 1000000000
		for _, word := range strings.Split(line, "\t") {
			v, _ := strconv.Atoi(word)
			if v > max {
				max = v
			}
			if v < min {
				min = v
			}
		}
		a1 += max - min
	}

	a2 := 0

	for _, line := range input {
		var ints []int
		for _, word := range strings.Split(line, "\t") {
			v, _ := strconv.Atoi(word)
			ints = append(ints, v)
		}
		for _, i := range ints {
			for _, j := range ints {
				if i > j && i%j == 0 {
					a2 += i / j
				}
			}
		}
	}

	println(a1, a2)
}
