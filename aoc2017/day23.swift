//
//  day23.swift
//  aoc2017
//
//  Created by Chris McElroy on 7/23/21.
//

import Foundation

func day23() {
	var reg: [String: Int] = [:]
//	var count = 0
	var i = 0
	let language: [String: Operation] = ["sub": .sub, "set": .set, "mul": .mult, "jnz": .jnz]
	
	reg["a"] = 1
	var count = 0
	
	while i < wordLines.count {
		if i == 31 {
			count += 1
			print(count, "31:", reg)
			reg["f"] = reg["b"]!.isPrime.int
			reg["g"]! += 17
			reg["b"]! += 17
			reg["h"]! += 1 - reg["f"]!
			if reg["g"]! == 0 { break }
			continue
		} else if i == 23 {
//			print("23:", reg)
//			reg["g"] = 0
//			i += 1
//			continue
		} else if i == 19 {
//			print("19:", reg)
			if reg["e"]! * reg["d"]! < reg["b"]! && reg["b"]! % reg["d"]! == 0 { reg["f"] = 0 }
			reg["e"]! = reg["b"]!
			i += 1
			continue
		} else if i == 20 {
//			print("20:", reg)
//			if reg["e"]! * reg["d"]! < reg["b"]! { reg["f"] = 0 }
			
		}
		compute(with: language, reg: &reg, line: &i)
	}
	
	print(reg["h"] ?? 0)
}
