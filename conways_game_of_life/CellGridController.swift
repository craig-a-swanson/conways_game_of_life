//
//  CellGridController.swift
//  conways_game_of_life
//
//  Created by Craig Swanson on 10/16/20.
//

import Foundation

class CellGridController {

    var cellsPerRow: Int = 25
    var nextGenArray: [Int] = Array(repeating: 0, count: 25*25)
    var currentGenArray: [Bool] = Array(repeating: false, count: 25*25)

    func buildCurrentGenArray() {
        for (index, element) in nextGenArray.enumerated() {
            switch element {
            case 0..<2:
                currentGenArray[index] = false
            case 2:
                continue
            case 3:
                currentGenArray[index] = true
            default:
                currentGenArray[index] = false
            }
        }
    }

    func buildNextGenArray() {
        // check to see if the result of index - <number> is negative; if so,
        // modify that result to work with the array.
        // check to see if the result of index + <number> is greater than count;
        // if so, modify that result to work with the array.
        // check to see if current index is at the left side or right side;
        // if so, modify the result of index +/- number to work with the array.
        
        for (index, element) in currentGenArray.enumerated() {
            var aliveCount = 0
            
            let northwest = index - (cellsPerRow + 1)
            let north = index - cellsPerRow
            let northeast = index - (cellsPerRow - 1)
            let east = index + 1
            let southeast = index + (cellsPerRow + 1)
            let south = index + cellsPerRow
            let southwest = index + (cellsPerRow - 1)
            let west = index - 1

            // special case for top left corner
            if index == 0 {
                currentGenArray[east] ? (aliveCount += 1) : (aliveCount += 0)
                currentGenArray[southeast] ? (aliveCount += 1) : (aliveCount += 0)
                currentGenArray[south] ? (aliveCount += 1) : (aliveCount += 0)
            }
            // special case for top row excluding the two corners
            if index > 0 && index <= (cellsPerRow - 2) {
                currentGenArray[east] ? (aliveCount += 1) : (aliveCount += 0)
                currentGenArray[southeast] ? (aliveCount += 1) : (aliveCount += 0)
                currentGenArray[south] ? (aliveCount += 1) : (aliveCount += 0)
                currentGenArray[southwest] ? (aliveCount += 1) : (aliveCount += 0)
                currentGenArray[west] ? (aliveCount += 1) : (aliveCount += 0)
            }
            // special case for top right corner
            if index == (cellsPerRow - 1) {
                currentGenArray[south] ? (aliveCount += 1) : (aliveCount += 0)
                currentGenArray[southwest] ? (aliveCount += 1) : (aliveCount += 0)
                currentGenArray[west] ? (aliveCount += 1) : (aliveCount += 0)
            }
            // special case for bottom left corner
            if index == (currentGenArray.count - cellsPerRow - 1) {
                currentGenArray[north] ? (aliveCount += 1) : (aliveCount += 0)
                currentGenArray[northeast] ? (aliveCount += 1) : (aliveCount += 0)
                currentGenArray[east] ? (aliveCount += 1) : (aliveCount += 0)
            }
            // special case for bottom row excluding two corners
            if index > (currentGenArray.count - cellsPerRow - 1) && index < (currentGenArray.count - 1) {
                currentGenArray[northwest] ? (aliveCount += 1) : (aliveCount += 0)
                currentGenArray[north] ? (aliveCount += 1) : (aliveCount += 0)
                currentGenArray[northeast] ? (aliveCount += 1) : (aliveCount += 0)
                currentGenArray[east] ? (aliveCount += 1) : (aliveCount += 0)
                currentGenArray[west] ? (aliveCount += 1) : (aliveCount += 0)
            }
            // special case for bottom right corner
            if index == currentGenArray.count {
                currentGenArray[northwest] ? (aliveCount += 1) : (aliveCount += 0)
                currentGenArray[north] ? (aliveCount += 1) : (aliveCount += 0)
                currentGenArray[west] ? (aliveCount += 1) : (aliveCount += 0)
            }
            
            if index >= cellsPerRow && index <= (currentGenArray.count - cellsPerRow - 1) {
                // case for left column
                if index % cellsPerRow == 0 {
                    currentGenArray[north] ? (aliveCount += 1) : (aliveCount += 0)
                    currentGenArray[northeast] ? (aliveCount += 1) : (aliveCount += 0)
                    currentGenArray[east] ? (aliveCount += 1) : (aliveCount += 0)
                    currentGenArray[southeast] ? (aliveCount += 1) : (aliveCount += 0)
                    currentGenArray[south] ? (aliveCount += 1) : (aliveCount += 0)
                // case for right column
                } else if (index + 1) % cellsPerRow == 0 {
                    currentGenArray[northwest] ? (aliveCount += 1) : (aliveCount += 0)
                    currentGenArray[north] ? (aliveCount += 1) : (aliveCount += 0)
                    currentGenArray[south] ? (aliveCount += 1) : (aliveCount += 0)
                    currentGenArray[southwest] ? (aliveCount += 1) : (aliveCount += 0)
                    currentGenArray[west] ? (aliveCount += 1) : (aliveCount += 0)
                } else {
                    currentGenArray[northwest] ? (aliveCount += 1) : (aliveCount += 0)
                    currentGenArray[north] ? (aliveCount += 1) : (aliveCount += 0)
                    currentGenArray[northeast] ? (aliveCount += 1) : (aliveCount += 0)
                    currentGenArray[east] ? (aliveCount += 1) : (aliveCount += 0)
                    currentGenArray[southeast] ? (aliveCount += 1) : (aliveCount += 0)
                    currentGenArray[south] ? (aliveCount += 1) : (aliveCount += 0)
                    currentGenArray[southwest] ? (aliveCount += 1) : (aliveCount += 0)
                    currentGenArray[west] ? (aliveCount += 1) : (aliveCount += 0)
                }
            }
            
//            currentGenArray[index - (cellsPerRow + 1)] ? (aliveCount += 1) : (aliveCount += 0)  // NW
//            currentGenArray[index - cellsPerRow] ? (aliveCount += 1) : (aliveCount += 0)        // N
//            currentGenArray[index - (cellsPerRow - 1)] ? (aliveCount += 1) : (aliveCount += 0)  // NE
//            currentGenArray[index + 1] ? (aliveCount += 1) : (aliveCount += 0)                  // E
//            currentGenArray[index + (cellsPerRow + 1)] ? (aliveCount += 1) : (aliveCount += 0)  // SE
//            currentGenArray[index + cellsPerRow] ? (aliveCount += 1) : (aliveCount += 0)        // S
//            currentGenArray[index + (cellsPerRow - 1)] ? (aliveCount += 1) : (aliveCount += 0)  // SW
//            currentGenArray[index - 1] ? (aliveCount += 1) : (aliveCount += 0)                  // W

            nextGenArray[index] = aliveCount
        }
    }

}
