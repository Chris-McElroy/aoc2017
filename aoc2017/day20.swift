//
//  day20.swift
//  aoc2017
//
//  Created by Chris McElroy on 7/23/21.
//

import Foundation

func day20() {
	var min = Int.max
	var best = 0
	
	var particles: [(p: C3, v: C3, a: C3)] = []
	for line in wordLines.enumerated() {
		let pVals = line.element[0].split(separator: "<")[1].dropLast(2).split(separator: ",")
		let p = C3(Int(pVals[0])!, Int(pVals[1])!, Int(pVals[2])!)
		
		let vVals = line.element[1].split(separator: "<")[1].dropLast(2).split(separator: ",")
		let v = C3(Int(vVals[0])!, Int(vVals[1])!, Int(vVals[2])!)
		
		let aVals = line.element[2].split(separator: "<")[1].dropLast().split(separator: ",")
		let a = C3(Int(aVals[0])!, Int(aVals[1])!, Int(aVals[2])!)
		
		particles.append((p, v, a))
		
		if a.manhattanDistance() < min {
			min = a.manhattanDistance()
			best = line.offset
		}
	}
	
	print(particles.count, particles[best])
	
	for _ in stride(from: 0, to: 1000, by: 1) {
		var pDict: [C3: [Int]] = [:]
		var newParticles: [(p: C3, v: C3, a: C3)] = []
		
		for (i, var p) in particles.enumerated() {
			p.v += p.a
			p.p += p.v
			
			pDict[p.p, default: []] += [i]
			
			newParticles.append(p)
		}
		
		particles = []
		
		for p in pDict {
			if p.value.count == 1 {
				for i in p.value {
					particles.append(newParticles[i])
				}
			}
		}
		
	}
	
	
	
	print(min, best, particles.count)
}
