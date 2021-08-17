package main

import (
	"fmt"
	"io/ioutil"
	"math"
	"sort"
	"strconv"
	"strings"
)

// inputs //

func inputLines() []string {
	fileName := "input" + fmt.Sprint(day)
	if day < 10 {
		fileName = "input0" + fmt.Sprint(day)
	}
	input, _ := ioutil.ReadFile("input/" + fileName)
	return dropLast(strings.Split(string(input), "\n"))
}

func inputWords() [][]string {
	var words [][]string
	for _, line := range input {
		words = append(words, strings.Split(line, " "))
	}
	return words
}

func inputInts() []int {
	var ints []int
	for _, line := range input {
		v, _ := strconv.Atoi(line)
		ints = append(ints, v)
	}
	return ints
}

// shortcuts

func abs(v int) int {
	if v >= 0 {
		return v
	}
	return -v
}

type C2 struct {
	x int
	y int
}

func (p C2) adjacents() []C2 {
	zeroAdjacents := []C2{{-1, 0}, {0, -1}, {0, 1}, {1, 0}}
	var adjacents []C2
	for _, o := range zeroAdjacents {
		adjacents = append(adjacents, p.adding(o))
	}
	return adjacents
}

func (p C2) neighbors() []C2 {
	zeroNeighbors := []C2{{-1, -1}, {-1, 0}, {-1, 1}, {0, -1}, {0, 1}, {1, -1}, {1, 0}, {1, 1}}
	var neighbors []C2
	for _, o := range zeroNeighbors {
		neighbors = append(neighbors, p.adding(o))
	}
	return neighbors
}

func (p C2) rotatingLeft() C2 {
	return C2{-p.y, p.x}
}

func (p C2) rotatingRight() C2 {
	return C2{p.y, -p.x}
}

func (p C2) rotating(left bool) C2 {
	if left {
		return p.rotatingLeft()
	}
	return p.rotatingRight()
}

func (p *C2) rotateLeft() {
	temp := p.x
	p.x = -p.y
	p.y = temp
}

func (p *C2) rotateRight() {
	temp := -p.x
	p.x = p.y
	p.y = temp
}

func (p *C2) rotate(left bool) {
	if left {
		p.rotateLeft()
	}
	p.rotateRight()
}

func (p C2) manhattanDistance() int {
	return abs(p.x) + abs(p.y)
}

func (p C2) vectorLength() float64 {
	return math.Sqrt(float64(p.x*p.x + p.y*p.y))
}

func (lhs C2) adding(rhs C2) C2 {
	return C2{lhs.x + rhs.x, lhs.y + rhs.y}
}

func (lhs C2) subtracting(rhs C2) C2 {
	return C2{lhs.x - rhs.x, lhs.y - rhs.y}
}

func (lhs *C2) add(rhs C2) {
	lhs.x += rhs.x
	lhs.y += rhs.y
}

func (lhs *C2) subtract(rhs C2) {
	lhs.x -= rhs.x
	lhs.y -= rhs.y
}

type C3 struct {
	x int
	y int
	z int
}

func (p C3) adjacents() []C3 {
	zeroAdjacents := []C3{{-1, 0, 0}, {0, -1, 0}, {0, 0, -1}, {0, 0, 1}, {0, 1, 0}, {1, 0, 0}}
	var adjacents []C3
	for _, o := range zeroAdjacents {
		adjacents = append(adjacents, p.adding(o))
	}
	return adjacents
}

func (p C3) neighbors() []C3 {
	zeroNeighbors := []C3{{-1, -1, -1}, {-1, -1, 0}, {-1, -1, 1}, {-1, 0, -1}, {-1, 0, 0}, {-1, 0, 1}, {-1, 1, -1}, {-1, 1, 0}, {-1, 1, 1}, {0, -1, -1}, {0, -1, 0}, {0, -1, 1}, {0, 0, -1}, {0, 0, 1}, {0, 1, -1}, {0, 1, 0}, {0, 1, 1}, {1, -1, -1}, {1, -1, 0}, {1, -1, 1}, {1, 0, -1}, {1, 0, 0}, {1, 0, 1}, {1, 1, -1}, {1, 1, 0}, {1, 1, 1}}
	var neighbors []C3
	for _, o := range zeroNeighbors {
		neighbors = append(neighbors, p.adding(o))
	}
	return neighbors
}

func (p C3) manhattanDistance() int {
	return abs(p.x) + abs(p.y) + abs(p.z)
}

func (p C3) vectorLength() float64 {
	return math.Sqrt(float64(p.x*p.x + p.y*p.y + p.z*p.z))
}

func (lhs C3) adding(rhs C3) C3 {
	return C3{lhs.x + rhs.x, lhs.y + rhs.y, lhs.z + rhs.z}
}

func (lhs C3) subtracting(rhs C3) C3 {
	return C3{lhs.x - rhs.x, lhs.y - rhs.y, lhs.z - rhs.z}
}

func (lhs *C3) add(rhs C3) {
	lhs.x += rhs.x
	lhs.y += rhs.y
	lhs.z += rhs.z
}

func (lhs *C3) subtract(rhs C3) {
	lhs.x -= rhs.x
	lhs.y -= rhs.y
	lhs.z -= rhs.z
}

type stringSet struct {
	m map[string]struct{}
}

func (s *stringSet) insert(value string) bool {
	_, prev := s.m[value]
	s.m[value] = struct{}{}
	return !prev
}

func dropLast(s []string) []string {
	return s[:len(s)-1]
}

func SortString(w string) string {
	s := strings.Split(w, "")
	sort.Strings(s)
	return strings.Join(s, "")
}

func intListOf16ListContains(list [][16]int, item [16]int) bool {
	for _, intList := range list {
		if intListOf16Equals(intList, item) {
			return true
		}
	}
	return false
}

func intListOf16Equals(list1 [16]int, list2 [16]int) bool {
	for i, v1 := range list1 {
		if v1 != list2[i] {
			return false
		}
	}
	return true
}
