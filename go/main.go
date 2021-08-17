package main

const day = 1

var input = inputLines()
var wordLines = inputWords()
var intLines = inputInts()

func main() {
	switch day {
	case 1:
		day1()
	case 2:
		day2()
	case 3:
		day3()
	case 4:
		day4()
	case 5:
		day5()
	case 6:
		day6()
	case 7:
		day7()
	case 8:
		day8()
	case 9:
		day9()
	case 10:
		day10()
	case 11:
		day11()
	case 12:
		day12()
	case 13:
		day13()
	case 14:
		day14()
	case 15:
		day15()
	case 16:
		day16()
	case 17:
		day17()
	case 18:
		day18()
	case 19:
		day19()
	case 20:
		day20()
	case 21:
		day21()
	case 22:
		day22()
	case 23:
		day23()
	case 24:
		day24()
	case 25:
		day25()
	default:
		(&C2{}).rotate(true)
		C2{}.rotating(true)
		C2{}.adjacents()
		C2{}.vectorLength()
		C2{}.subtracting(C2{})
		(&C2{}).subtract(C2{})
		C3{}.neighbors()
		C3{}.adjacents()
		C3{}.manhattanDistance()
		C3{}.vectorLength()
		C3{}.adding(C3{})
		C3{}.subtracting(C3{})
		(&C3{}).add(C3{})
		(&C3{}).subtract(C3{})
	}
}
