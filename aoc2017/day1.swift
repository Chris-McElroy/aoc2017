//
//  day1.swift
//  aoc2017
//
//  Created by Chris McElroy on 7/22/21.
//

import Foundation

func day1() {
	let string = input[0]
	
	var sum = 0
	for (i,c) in string.enumerated() where c == string[(i + string.count/2) % string.count] {
		sum += Int(String(c))!
	}
	
	print(sum)
}
