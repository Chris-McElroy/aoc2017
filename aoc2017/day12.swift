//
//  day12.swift
//  aoc2017
//
//  Created by Chris McElroy on 7/23/21.
//

import Foundation

func day12() {
	var chart: [Int: [Int]] = [:]
	
	for line in inputWords(day) {
		chart[Int(line[0])!] = line.dropFirst(2).map { Int($0.filter({ $0 != "," }))! }
	}
	
	var seen: Set<Int> = []
	var c = 0
	
	for i in chart.keys {
		if seen.contains(i) { continue }
		
		c += 1
		var new = [i]
		
		while let v = new.popLast() {
			if !seen.contains(v) {
				seen.insert(v)
				new.append(contentsOf: chart[v] ?? [])
			}
		}
	}
	
	print(c)
}
