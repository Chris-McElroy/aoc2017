//
//  day13.swift
//  aoc2017
//
//  Created by Chris McElroy on 7/23/21.
//

import Foundation

func day13() {
	var filters: [Int: Set<Int>] = [:]
	var mult = 1
	var offsets: [Int] = [0]
	
	for line in wordLines {
		let depth = Int(line[0].filter({ $0 != ":" }))!
		let range = 2*Int(line[1])! - 2
		filters[range, default: Set(0..<range)].remove((range - (depth % range)) % range)
	}
	
	for (range, depths) in filters.sorted(by: { $0.key < $1.key }) {
		let nextMult = lcm(mult, range)
		var nextOffsets: [Int] = []
		for i in 0..<nextMult/mult {
			let extra = i*mult
			for o in offsets {
				if depths.contains((o + extra) % range) {
					nextOffsets.append(o + extra)
				}
			}
		}
		print(range, depths, mult, offsets)
		mult = nextMult
		offsets = nextOffsets
	}
	
	print(offsets.min()!)
}

// 1928 too high
// 3834136 part two
