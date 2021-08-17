//
//  day8.swift
//  aoc2017
//
//  Created by Chris McElroy on 7/23/21.
//

import Foundation

func day8() {
	var reg: [String: Int] = [:]
	
	let input = inputWords(8)
	var max = 0
	
	for line in input {
		var pos = -1
		if line[1] == "inc" {
			pos = 1
		}
//		let amt = Int(line[2])!
		switch line[5] {
		case "<":
			if reg[line[4], default: 0] < Int(line[6])! {
				reg[line[0], default: 0] += pos*Int(line[2])!
			}
		case ">":
			if reg[line[4], default: 0] > Int(line[6])! {
				reg[line[0], default: 0] += pos*Int(line[2])!
			}
		case "<=":
			if reg[line[4], default: 0] <= Int(line[6])! {
				reg[line[0], default: 0] += pos*Int(line[2])!
			}
		case ">=":
			if reg[line[4], default: 0] >= Int(line[6])! {
				reg[line[0], default: 0] += pos*Int(line[2])!
			}
		case "==":
			if reg[line[4], default: 0] == Int(line[6])! {
				reg[line[0], default: 0] += pos*Int(line[2])!
			}
		case "!=":
			if reg[line[4], default: 0] != Int(line[6])! {
				reg[line[0], default: 0] += pos*Int(line[2])!
			}
		default: break
		}
		let cMax = reg.values.max()!
		if cMax > max { max = cMax }
 	}
	
	print(max)
}
