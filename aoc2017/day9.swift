//
//  day9.swift
//  aoc2017
//
//  Created by Chris McElroy on 7/23/21.
//

import Foundation

func day9() {
	let input = inputLines(9)[0]
	var depth = 0
	var score = 0
	var inGarbage = false
	var ignoreNext = false
	var co = 0
	
	for c in input {
		if ignoreNext { ignoreNext = false; continue }
		if !inGarbage {
			if c == "{" {
				depth += 1
				score += depth
			} else if c == "}" {
				depth -= 1
			} else if c == "<" {
				inGarbage = true
			}
		} else {
			if c == "!" {
				ignoreNext = true
			} else if c == ">" {
				inGarbage = false
			} else {
				co += 1
			}
		}
	}
	
	print(score, co)
}
