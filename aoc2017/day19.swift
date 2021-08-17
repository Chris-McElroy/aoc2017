//
//  day19.swift
//  aoc2017
//
//  Created by Chris McElroy on 7/23/21.
//

import Foundation

func day19() {
	var pos = C2(input[0].enumerated().first(where: { $0.element == "|" })!.offset, 0)
	var dir = C2(0, 1)
	var found = ""
	var steps = 0
	while true {
		if pos.y.isin(0..<input.count), pos.x.isin(0..<input[pos.y].count), input[pos.y][pos.x] != "+" {
			if !input[pos.y][pos.x].isin("|-") {
				found.append(input[pos.y][pos.x])
				print("got one!", input[pos.y][pos.x])
				if input[pos.y][pos.x] == "Q" {
					break
				}
			}
			pos += dir
		} else {
			let forward = pos + dir
			if forward.y.isin(0..<input.count), forward.x.isin(0..<input[forward.y].count), input[forward.y][forward.x] != " " {
				pos += dir
			} else {
				var ended = true
				for next in pos.adjacents where next != pos - dir {
					if next.y.isin(0..<input.count), next.x.isin(0..<input[next.y].count), input[next.y][next.x] != " " {
						dir = next - pos
						pos = next
						ended = false
						break
					}
				}
				if ended { break }
			}
		}
		steps += 1
	}
	
	print(found, steps)
}
