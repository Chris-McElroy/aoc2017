//
//  day18.swift
//  aoc2017
//
//  Created by Chris McElroy on 7/23/21.
//

import Foundation

func day18() {
	let input = inputWords(18)
	var sent: [[Int]] = [[],[]]
	var line = [0,0]
	var reg: [[String: Int]] = [[:],[:]]
	
	reg[0]["p"] = 0
	reg[1]["p"] = 1
	
	var co = 0
	var n = 1
	
	repeat {
		runTillDry()
		runTillDry()
	} while !sent.joined().isEmpty && line.max()! < input.count
	
	func runTillDry() {
		n ^= 1
		
		while line[n] < input.count {
			let instr = input[line[n]]
			var v1 = reg[n][instr[1]] ?? 0
			if let v = Int(instr[1]) { v1 = v }
			
			var v2 = instr.count == 3 ? reg[n][instr[2]] ?? 0 : 0
			if let v = instr.count == 3 ? Int(instr[2]) : nil { v2 = v }
			
			switch instr[0] {
			case "snd":
				sent[n^1].insert(v1, at: 0)
				if n == 1 { co += 1 }
			case "set":
				reg[n][instr[1], default: 0] = v2
			case "add":
				reg[n][instr[1], default: 0] += v2
			case "mul":
				reg[n][instr[1], default: 0] *= v2
			case "mod":
				reg[n][instr[1], default: 0] %= v2
			case "rcv":
				if let new = sent[n].popLast() {
					reg[n][instr[1], default: 0] = new
				} else {
					return
				}
			case "jgz":
				if v1 > 0 {
					line[n] += v2 - 1
				}
			default: break
			}
			line[n] += 1
		}
	}
	
	print(co)
}
// 6096
