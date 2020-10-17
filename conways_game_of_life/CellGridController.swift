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
            
            if (index - cellsPerRow - 1) >= 0 && (index + cellsPerRow + 1) < currentGenArray.count {
                currentGenArray[index - (cellsPerRow + 1)] ? (aliveCount += 1) : (aliveCount += 0)  // NW
                currentGenArray[index - cellsPerRow] ? (aliveCount += 1) : (aliveCount += 0)        // N
                currentGenArray[index - (cellsPerRow - 1)] ? (aliveCount += 1) : (aliveCount += 0)  // NE
                currentGenArray[index + 1] ? (aliveCount += 1) : (aliveCount += 0)                  // E
                currentGenArray[index + (cellsPerRow + 1)] ? (aliveCount += 1) : (aliveCount += 0)  // SE
                currentGenArray[index + cellsPerRow] ? (aliveCount += 1) : (aliveCount += 0)        // S
                currentGenArray[index + (cellsPerRow - 1)] ? (aliveCount += 1) : (aliveCount += 0)  // SW
                currentGenArray[index - 1] ? (aliveCount += 1) : (aliveCount += 0)                  // W
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
