//
//  day24.swift
//  aoc2017
//
//  Created by Chris McElroy on 7/23/21.
//

import Foundation

func day24() {
	struct Bridge: Hashable {
		let strength: Int
		let last: Int
		let used: Set<Int>
	}
	
	var connections: [Int: [Int]] = [:]
	var otherPort: [[Int: Int]] = []
	var bridges: Set<Bridge> = []
	
	for (i, line) in input.enumerated() {
		let ports = line.split(separator: "/").map({ Int($0)! })
		
		connections[ports[0], default: []].append(i)
		connections[ports[1], default: []].append(i)
		
		otherPort.append(ports[0] == ports[1] ? [ports[0]: ports[1]] : [ports[0]: ports[1], ports[1]: ports[0]])
		
		if ports[0] == 0 {
			bridges.insert(Bridge(strength: ports.sum(), last: ports[1], used: [i]))
		}
		if ports[1] == 0 {
			bridges.insert(Bridge(strength: ports.sum(), last: ports[0], used: [i]))
		}
		
	}

	var strongest = 0
	var longest = 0
	
	bfs(startingWith: bridges, expandUsing: { bridge in
		if bridge.used.count > longest || (bridge.used.count == longest && bridge.strength > strongest) {
			longest = bridge.used.count
			strongest = bridge.strength
		}
		var bridges: [Bridge] = []
		for i in connections[bridge.last] ?? [] where !bridge.used.contains(i) {
			let newLast = otherPort[i][bridge.last]!
			bridges.append(Bridge(strength: bridge.strength + bridge.last + newLast, last: newLast, used: bridge.used.union([i])))
		}
		return bridges
	}, continueWhile: { _, _ in true }
	)
	
	print(longest, strongest)
}
