//
//  day3.swift
//  aoc2017
//
//  Created by Chris McElroy on 7/23/21.
//

import Foundation

func day3() {
	let count = Int(input[0])!
	
	var grid: [Int: [Int: Int]] = [0: [0: 1]]
	
	var pos = C2(1,0)
	var dir = C2(0,1)
	var a2 = 0
	for _ in stride(from: 2, to: count, by: 1) {
		var sum = 0
		if a2 == 0 {
			for p in pos.neighbors {
				sum += grid[p.x]?[p.y] ?? 0
			}
			if sum > count { a2 = sum }
		}
		grid[pos.x, default: [:]][pos.y] = sum
		pos += dir
		dir.rotateLeft()
		if grid[pos.x + dir.x]?[pos.y + dir.y] != nil {
			dir.rotateRight()
		}
	}
	
	print(pos.manhattanDistance(), a2)
}
// 552 330785
