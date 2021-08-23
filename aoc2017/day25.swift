//
//  day25.swift
//  aoc2017
//
//  Created by Chris McElroy on 7/23/21.
//

import Foundation

func day25() {
	enum State { case A, B, C, D, E, F }
	
	var state: State = .A
	var cursor = 0
	var tape: [Int: Int] = [:]
	var steps = 0
	let end = 12386363
	
	while steps < end {
		switch state {
		case .A:
			let v = tape[cursor, default: 0]
			tape[cursor] = v^1
			cursor += v == 0 ? 1 : -1
			state = v == 0 ? .B : .E
		case .B:
			let v = tape[cursor, default: 0]
			tape[cursor] = v^1
			cursor += v == 0 ? -1 : 1
			state = v == 0 ? .C : .A
		case .C:
			let v = tape[cursor, default: 0]
			tape[cursor] = v^1
			cursor += v == 0 ? -1 : 1
			state = v == 0 ? .D : .C
		case .D:
			let v = tape[cursor, default: 0]
			tape[cursor] = v^1
			cursor += -1
			state = v == 0 ? .E : .F
		case .E:
			let v = tape[cursor, default: 0]
			tape[cursor] = 1
			cursor += -1
			state = v == 0 ? .A : .C
		case .F:
			let v = tape[cursor, default: 0]
			tape[cursor] = 1
			cursor += v == 0 ? -1 : 1
			state = v == 0 ? .E : .A
		}
		steps += 1
	}
	
	print(tape.values.sum())
}
