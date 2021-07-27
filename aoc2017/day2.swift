//
//  day2.swift
//  aoc2017
//
//  Created by Chris McElroy on 7/23/21.
//

import Foundation

func day2() {
	var sum = 0
	for line in input {
		var ints: [Int] = []
		for word in line.split(separator: "\t") {
			ints.append(Int(word)!)
		}
		for i in ints {
			for j in ints where i > j && i % j == 0 {
				sum += i/j
			}
		}
	}
	
	print(sum)
}
