//
//  day6.swift
//  aoc2017
//
//  Created by Chris McElroy on 7/23/21.
//

import Foundation

func day6() {
	var banks = input[0].split(separator: "\t").map { Int($0)! }
	var hist: Set<[Int]> = []
	
	while hist.insert(banks).inserted {
		var (i, m) = banks.enumerated().max(by: { $0.element < $1.element })!
		banks[i] = 0
		while m > 0 {
			i += 1
			i %= banks.count
			banks[i] += 1
			m -= 1
		}
	}
	
	hist = []
	
	while hist.insert(banks).inserted {
		var (i, m) = banks.enumerated().max(by: { $0.element < $1.element })!
		banks[i] = 0
		while m > 0 {
			i += 1
			i %= banks.count
			banks[i] += 1
			m -= 1
		}
	}
	
	print(hist.count)
}
