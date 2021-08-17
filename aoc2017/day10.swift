//
//  day10.swift
//  aoc2017
//
//  Created by Chris McElroy on 7/23/21.
//

import Foundation

func day10() {
	let input = inputLines(10)[0].map { Int(exactly: $0.asciiValue!)! } + [17, 31, 73, 47, 23]
	let tot = 256
	var arr = Array(0..<tot)
	var skip = 0
	var p = 0
	
	for _ in 0..<64 {
		for len in input {
			print(p, len, skip, arr.count)
			if len > 0 {
				arr = Array(arr.dropFirst(p % tot) + arr.first(p))
				arr = Array(arr.first(len).reversed() + arr.dropFirst(len))
				arr = Array(arr.dropFirst((tot - p)) + arr.first(tot - p))
			}
			p = (p + len + skip) % tot
			skip += 1
		}
	}
	
	var denseHash: [Int] = []
	for set in 0..<16 {
		var v = 0
		for e in arr.slice(from: set*16, to: set*16+16) {
			v ^= e
		}
		denseHash.append(v)
	}
	
	var hash = denseHash.map { String($0, radix: 16) }
	hash = hash.map { $0.count < 2 ? "0" + $0 : $0 }
	
//	print(p, input.last!, skip, arr.count)
	
	print(hash.joined())
}
// 64770 too high
// 45582 too high
// 90adb097dd55dea8305c90372258ac6 wrong
