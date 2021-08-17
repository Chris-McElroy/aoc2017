//
//  day7.swift
//  aoc2017
//
//  Created by Chris McElroy on 7/23/21.
//

import Foundation

func day7() {
	let input = inputWords(7)
	var all: [String: ([String], Int)] = [:]
	var held: Set<String> = []
	
	for line in input {
		let main = line[0]
		var sub: [String] = []
		if line.count > 2 {
			for i in 3..<line.count {
				let p = line[i].filter({ $0 != "," })
				held.insert(p)
				sub.append(p)
			}
		}
		all[main] = (sub, Int(line[1].dropFirst().dropLast())!)
	}
	
	let bottom = Set(all.keys).subtracting(held).first!

	print(bottom)
	
	func getWeight(for main: String) -> Int {
		let weight = all[main]!.1
		var subs: [Int: (Int, [String])] = [:]
		for sub in all[main]!.0 {
			let last = subs[getWeight(for: sub), default: (0, [])]
			subs[getWeight(for: sub)] = (last.0 + 1, last.1 + [sub])
		}
		if subs.count > 1 {
			let real = subs.max(by: { $0.value.0 < $1.value.0 })!
			let wrong = subs.min(by: { $0.value.0 < $1.value.0 })!
			let original = all[wrong.value.1.first!]!.1
			print("error", real.key, wrong, original)
		}
		return subs.reduce(weight, { $0 + $1.key*$1.value.0 })
	}
	
	print(getWeight(for: bottom))
	
//	var stack: [String] = Array(all.filter { $0.value.0.isEmpty }.keys)
//	var broke: String = ""
//	var done: Set<String> = []
////
////	while !stack.isEmpty {
////		var nextStack: [String] = []
////
////		for p in stack {
//////			if done.contains(p) { continue }
////			let weights = Array(all[p]!.1.dropFirst())
////			if weights.count == 3 {
////				if weights[0] != weights[1] || weights[1] != weights[2] {
////					print(p)
////				}
////			}
////			guard weights.count.isin([0,3]) else { nextStack.append(p); continue }
//////			done.insert(p)
////			guard let holder = all.first(where: { $0.value.0.contains(p) })?.key else { print("got to", p); continue }
////			nextStack.append(holder)
////			all[holder] = (all[holder]!.0, all[holder]!.1 + [all[p]!.1.sum()])
////		}
////
////		stack = nextStack
////		nextStack = []
////	}
////
////
}
