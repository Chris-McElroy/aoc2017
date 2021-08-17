//
//  day14.swift
//  aoc2017
//
//  Created by Chris McElroy on 7/23/21.
//

import Foundation

func day14() {
	let input = "jxqlasbh"
	
	var sum = 0
	var disk: [[Bool]] = []
	
	for i in 0..<128 {
		disk.append([])
		for c in knotHash(input + "-" + String(i)) {
			let n = Int(String(c), radix: 16)!
			sum += n.nonzeroBitCount
			for j in 0..<4 {
				disk[i].append(n / (8 >> j) % 2 == 1)
			}
		}
	}
	
	var seen: Set<C2> = []
	var regions = 0
	
	for x in 0..<128 {
		for y in 0..<128 {
			let p = C2(x, y)
			
			if seen.contains(p) || !disk[p.x][p.y] { continue }
			
			regions += 1
			
			var new = [p]
			
			while let v = new.popLast() {
				if !v.x.isin(0..<128) || !v.y.isin(0..<128) { continue }
				if seen.contains(v) || !disk[v.x][v.y] { continue }
				seen.insert(v)
				new.append(contentsOf: v.adjacents)
			}
		}
	}
	
	print(sum, regions)
	
	func knotHash(_ string: String) -> String {
		let input = string.map { Int(exactly: $0.asciiValue!)! } + [17, 31, 73, 47, 23]
		let tot = 256
		var arr = Array(0..<tot)
		var skip = 0
		var p = 0
		
		for _ in 0..<64 {
			for len in input {
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
		
//		print(string, hash.joined())
		return hash.joined()
	}
}
