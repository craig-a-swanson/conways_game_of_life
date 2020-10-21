//
//  CellGridController.swift
//  conways_game_of_life
//
//  Created by Craig Swanson on 10/16/20.
//

import Foundation

class CellGridController {

    // MARK: - Properties
    var cellsPerRow: Int = 25
    lazy var nextGenArray: [Int] = {
        let newArray = Array(repeating: 0, count: cellsPerRow * cellsPerRow)
        return newArray
    }()
    lazy var currentGenArray: [Bool] = {
        let newArray = Array(repeating: false, count: cellsPerRow * cellsPerRow)
        return newArray
    }()
//    var nextGenArray: [Int] = Array(repeating: 0, count: 25*25)
//    var currentGenArray: [Bool] = Array(repeating: false, count: 25*25)

    // MARK: - Current Generation Method
    /// Builds the array for the current generation of cells using the values from the next generation array
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

    // MARK: - Next Generation Method
    /// Builds the array for the next generation of cells using the values from the current generation array
    func buildNextGenArray() {
        // check to see if the result of index - <number> is negative; if so,
        // modify that result to work with the array.
        // check to see if the result of index + <number> is greater than count;
        // if so, modify that result to work with the array.
        // check to see if current index is at the left side or right side;
        // if so, modify the result of index +/- number to work with the array.
        
        for (index, _) in currentGenArray.enumerated() {
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
            if index == (currentGenArray.count - cellsPerRow) {
                currentGenArray[north] ? (aliveCount += 1) : (aliveCount += 0)
                currentGenArray[northeast] ? (aliveCount += 1) : (aliveCount += 0)
                currentGenArray[east] ? (aliveCount += 1) : (aliveCount += 0)
            }
            // special case for bottom row excluding two corners
            if index > (currentGenArray.count - cellsPerRow) && index < (currentGenArray.count - 1) {
                currentGenArray[northwest] ? (aliveCount += 1) : (aliveCount += 0)
                currentGenArray[north] ? (aliveCount += 1) : (aliveCount += 0)
                currentGenArray[northeast] ? (aliveCount += 1) : (aliveCount += 0)
                currentGenArray[east] ? (aliveCount += 1) : (aliveCount += 0)
                currentGenArray[west] ? (aliveCount += 1) : (aliveCount += 0)
            }
            // special case for bottom right corner
            if index == currentGenArray.count - 1 {
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
            nextGenArray[index] = aliveCount
        }
    }

    // MARK: - Initial Grid Samples
    // The sample arrays include the index values for alive cells in a 25x25 grid.
    let pulsarArray = [
        131, 132, 133, 137, 138, 139,
        179, 184, 186, 191,
        204, 209, 211, 216,
        229, 234, 236, 241,
        256, 257, 258, 262, 263, 264,
        306, 307, 308, 312, 313, 314,
        329, 334, 336, 341,
        354, 359, 361, 366,
        379, 384, 386, 391,
        431, 432, 433, 437, 438, 439
    ]

    let pentadecathlonArray = [
        184, 209, 233, 235,
        259, 284, 309, 334,
        358, 360, 384, 409
    ]

    let lwssArray = [
        202, 203, 204, 205,
        226, 230,
        255,
        276, 279
    ]

    func randomStartingArray() -> [Int] {
        var tempArray: [Int] = []

        let numberOfAliveCells = Int(0.1 * Double((cellsPerRow * cellsPerRow)))
        
        for _ in 1...numberOfAliveCells {
            let randomIndex = Int.random(in: 0..<(cellsPerRow * cellsPerRow))
            tempArray.append(randomIndex)
        }
        return tempArray
    }

}
