//
//  day11.swift
//  aoc2017
//
//  Created by Chris McElroy on 7/23/21.
//

import Foundation

func day11() {
	let input = inputLines(11)[0].split(separator: ",")
	
	var ne = 0
	var n = 0
	var max = 0
	
	for step in input {
		switch step {
		case "ne": ne += 1
		case "nw": ne -= 1; n += 1
		case "sw": ne -= 1
		case "se": ne += 1; n -= 1
		case "n": n += 1
		case "s": n -= 1
		default: break
		}
		if abs(ne + n) > max { max = abs(ne + n) }
	}
	
	
	
	print(max)
}
