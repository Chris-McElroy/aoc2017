//
//  day15.swift
//  aoc2017
//
//  Created by Chris McElroy on 7/23/21.
//

import Foundation

func day15() {
//	let input = inputLines(15)
	
	let genAmult = 16807
	let genBmult = 48271
	
	var genA = 783
	var genB = 325
	
	let div = 2147483647
	
	var matched = 0
	
	for _ in stride(from: 0, to: 5000000, by: 1) {
		repeat {
			genA = (genA * genAmult) % div
		} while genA % 4 != 0
		
		repeat {
			genB = (genB * genBmult) % div
		} while genB % 8 != 0
		
		if genA % (1 << 16) == genB % (1 << 16) {
			matched += 1
		}
	}
	
	print(matched)
}
