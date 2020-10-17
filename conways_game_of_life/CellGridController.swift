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

}
