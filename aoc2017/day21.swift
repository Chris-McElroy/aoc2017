//
//  day21.swift
//  aoc2017
//
//  Created by Chris McElroy on 7/23/21.
//

import Foundation

func day21() {
	var rules: [[String]: [String]] = [:]
	
	for line in wordLines {
		let small = line[0].split(separator: "/").map({ String($0) })
		let big = line[2].split(separator: "/").map({ String($0) })
		rules[small] = big
		rules[Array(small.reversed())] = big
		
		let upd = Array(small.map({ String($0.reversed()) }).reversed())
		rules[upd] = big
		rules[Array(upd.reversed())] = big
		
		let left = (0..<small.count).map{ x in String((0..<small.count).map { y in small[small.count - 1 - y][x] }) }
		rules[left] = big
		rules[Array(left.reversed())] = big
		
		let right = (0..<small.count).map{ x in String((0..<small.count).map { y in small[y][small.count - 1 - x] }) }
		rules[right] = big
		rules[Array(right.reversed())] = big
	}
	
	var pattern = [".#.","..#","###"]
	
	for _ in 0..<18 {
		let size = pattern.count
		print(size)
		var newPattern: [String] = []
		
		if size % 2 == 0 {
			for y in 0..<size/2 {
				for _ in 0..<3 {
					newPattern.append("")
				}
				for x in 0..<size/2 {
					let chunk = pattern.slice(from: y*2, to: y*2 + 2).map { String($0.slice(from: x*2, to: 2)) }
					let newChunk = rules[chunk]
					guard newChunk != nil else { print("WOOOPS"); return }
					for newY in 0..<3 {
						newPattern[newY + y*3] += newChunk![newY]
					}
				}
			}
		} else {
			for y in 0..<size/3 {
				for _ in 0..<4 {
					newPattern.append("")
				}
				for x in 0..<size/3 {
					let chunk = pattern.slice(from: y*3, to: y*3 + 3).map { String($0.slice(from: x*3, to: 3)) }
					let newChunk = rules[chunk]
					guard newChunk != nil else { print("WOOOPS"); return }
					for newY in 0..<4 {
						newPattern[newY + y*4] += newChunk![newY]
					}
				}
			}
		}
		
		pattern = newPattern
	}
	
	let count = pattern.reduce(0) { sum, line in
		sum + line.reduce(0) { lineSum, c in
			lineSum + (c == "#").int
		}
	}
	
	print(count)
}
