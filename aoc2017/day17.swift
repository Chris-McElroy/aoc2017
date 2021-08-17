//
//  day17.swift
//  aoc2017
//
//  Created by Chris McElroy on 7/23/21.
//

import Foundation

func day17() {
	let steps = 371
	var len = 1
	var i = 1
	var last = 1
	var p = 0
	while i <= 50000000 {
		p = (p + steps) % len + 1
		if p == 1 { last = i }
		len += 1
		i += 1
	}
	
	print(last)
}
// 1244 too low
