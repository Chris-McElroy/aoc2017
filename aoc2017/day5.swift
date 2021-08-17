//
//  day5.swift
//  aoc2017
//
//  Created by Chris McElroy on 7/23/21.
//

import Foundation

func day5() {
	let max = input.count
	var ins = input.map { Int($0)!}
	
	var i = 0
	var s = 0
	while i.isin(0..<max) {
		let temp = ins[i]
		ins[i] += ins[i] >= 3 ? -1 : 1
		i += temp
		s += 1
	}
	print(s)
}
