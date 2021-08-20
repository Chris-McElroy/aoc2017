//
//  day18.swift
//  aoc2017
//
//  Created by Chris McElroy on 7/23/21.
//

import Foundation

func day18() {
	var sent: [[Int]] = [[],[]]
	var line = [0,0]
	var reg: [[String: Int]] = [[:],[:]]
	let language: [String: Operation] = ["set": .set, "add": .add, "mul": .mult, "mod": .mod, "jgz": .jgz]
	
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
			if wordLines[line[n]][0] == "snd" {
				let v1 = intOrReg(val: wordLines[line[n]][1], reg: reg[n])
				sent[n^1].insert(v1, at: 0)
				if n == 1 { co += 1 }
				line[n] += 1
			} else if wordLines[line[n]][0] == "rcv" {
				if let new = sent[n].popLast() {
					reg[n][wordLines[line[n]][1]] = new
					line[n] += 1
				} else {
					return
				}
			} else {
				compute(with: language, reg: &reg[n], line: &line[n])
			}
		}
	}
	
	print(co)
}
// 6096
