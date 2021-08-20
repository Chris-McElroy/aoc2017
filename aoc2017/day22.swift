//
//  day22.swift
//  aoc2017
//
//  Created by Chris McElroy on 7/23/21.
//

import Foundation

func day22() {
	var pos = C2(input.count/2, -input.count/2)
	var dir = C2(0, 1)
	var infected: Set<C2> = []
	var weakened: Set<C2> = []
	var flagged: Set<C2> = []
	var count = 0
	
	for (y, line) in input.enumerated() {
		for (x, c) in line.enumerated() {
			if c == "#" {
				infected.insert(C2(x,-y))
			}
		}
	}
	
	for _ in stride(from: 0, to: 10000000, by: 1) {
		if infected.contains(pos) {
			infected.remove(pos)
			flagged.insert(pos)
			dir.rotateRight()
		} else if weakened.contains(pos) {
			weakened.remove(pos)
			infected.insert(pos)
			count += 1
		} else if flagged.contains(pos) {
			flagged.remove(pos)
			dir.rotateLeft()
			dir.rotateLeft()
		} else {
			weakened.insert(pos)
			dir.rotateLeft()
		}
		pos += dir
	}
	
	print(count)
}
// 5256
