package main

import (
	"strconv"
	"strings"
)

func day6() {
	bankStrings := strings.Split(input[0], "\t")
	banks := [16]int{}
	for i, strVal := range bankStrings {
		intVal, _ := strconv.Atoi(strVal)
		banks[i] = intVal
	}
	hist := [][16]int{}
	for !intListOf16ListContains(hist, banks) {

		hist = append(hist, banks)

		m := 0
		i := 0
		for j, v := range banks {
			if v > m {
				i = j
				m = v
			}
		}
		banks[i] = 0
		for m > 0 {
			i += 1
			i %= 16
			banks[i] += 1
			m -= 1
		}

	}

	print(len(hist))
}
