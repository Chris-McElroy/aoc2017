//
//  day4.swift
//  aoc2017
//
//  Created by Chris McElroy on 7/23/21.
//

import Foundation

func day4() {
	var validCount = 0
	
	for line in input {
		var valid = true
		var words: Set<Set<Character>> = []
		for word in line.split(separator: " ") {
			if !words.insert(Set(word)).inserted {
				valid = false
				break
			}
		}
		if valid { validCount += 1 }
	}
	
	print(validCount)
}
// 451 223
