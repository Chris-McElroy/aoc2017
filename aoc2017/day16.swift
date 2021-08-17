//
//  day16.swift
//  aoc2017
//
//  Created by Chris McElroy on 7/23/21.
//

import Foundation

func day16() {
	let input = inputLines(16)[0].split(separator: ",")
	
	var pos = Array("abcdefghijklmnop")
	var seen: Set<[Character]> = []
	
	func dance() {
		for line in input {
			switch line[0] {
			case "s":
				let len = Int(line.dropFirst())!
				pos = Array(pos.last(len)) + Array(pos.dropLast(len))
			case "x":
				let a = Int(line.dropFirst().split(separator: "/")[0])!
				let b = Int(line.split(separator: "/")[1])!
				let temp = pos[a]
				pos[a] = pos[b]
				pos[b] = temp
			case "p":
				let a = pos.firstIndex(of: line[1])!
				let b = pos.firstIndex(of: line[3])!
				let temp = pos[a]
				pos[a] = pos[b]
				pos[b] = temp
			default: break
			}
		}
	}
	
	while seen.insert(pos).inserted == true { dance() }
	for _ in stride(from: 0, to: 1000000000 % seen.count, by: 1) { dance() }
	
	print(String(pos))
}
