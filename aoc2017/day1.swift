//
//  day1.swift
//  aoc2017
//
//  Created by Chris McElroy on 7/22/21.
//

import Foundation

func day1() {
	let input = inputLines(1)[0]
	
	var sum = 0
	for (i,c) in input.enumerated() {
		if c == input[(i + input.count/2) % input.count] { sum += Int(String(c))! }
	}
	print(sum)
}
