//
//  GridView.swift
//  conways_game_of_life
//
//  Created by Craig Swanson on 10/15/20.
//

import UIKit

class GridView: UIControl {

    // MARK: - Properties
    var cellGridController = CellGridController()

    // array of labels used to change colors and keep track of indexes via labels' tag properties
    private var labelArray: [UILabel] = []

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        backgroundColor = UIColor.white
    }

    // MARK: - Initialize (draw) the grid
    override func draw(_ rect: CGRect) {

        let currentGenArray = cellGridController.currentGenArray
        let gridSize: CGFloat = rect.size.width
        let cellSize: CGFloat = gridSize / CGFloat(cellGridController.cellsPerRow)

        for row in stride(from: CGFloat(0), through: CGFloat(cellGridController.cellsPerRow - 1), by: 1) {
            for column in stride(from: CGFloat(0), through: CGFloat(cellGridController.cellsPerRow - 1), by:1) {
//                create a row of labels with the appropriate size and background color
//                set the tag on the label equal to Int(row * column)
                let newCellLabel = UILabel(frame: CGRect(x: column * cellSize, y: row * cellSize, width: cellSize, height: cellSize))
                newCellLabel.tag = Int((row * 25) + column)

                var cellColor = UIColor.clear
                if currentGenArray[newCellLabel.tag] {
                    cellColor = UIColor.black
                }
                newCellLabel.backgroundColor = cellColor
                newCellLabel.layer.borderWidth = 0.5
                newCellLabel.layer.borderColor = UIColor.darkGray.cgColor
                addSubview(newCellLabel)
                labelArray.append(newCellLabel)
            }
        }
    }
    
//    The following block of code draws the grid without using labels.
//    I found labels to be easier to translate to the array elements by way of label tags.
//
//        for row in 0..<cellsPerRow {
//            for column in 0..<cellsPerRow {
//                let cellSquare = CGRect(x: CGFloat(CGFloat(column) * cellSize),
//                                        y: CGFloat(CGFloat(row) * cellSize),
//                                        width: cellSize,
//                                        height: cellSize)
//                var cellColor = UIColor.clear
//                if currentGenArray[index] {
//                    cellColor = UIColor.black
//                }
//                index += 1
//                addRectangle(addRect: cellSquare, withColor: cellColor)
//            }
//        }
//    func addRectangle(addRect rectangle: CGRect, withColor color: UIColor) {
//        if let context = UIGraphicsGetCurrentContext() {
//            context.addRect(rectangle)
//            context.setFillColor(color.cgColor)
//            context.fillPath()
//        }
//    }
    
    // MARK: - Methods
    /// Used for the user's initial set-up of the grid; user clicks on cell to make it alive before starting simulation
    /// - Parameter touch: point on screen where user lifted finger from screen
    private func initialSetup(at touch: UITouch) {
        let touchPoint = touch.location(in: self)
        
        for cell in labelArray {
            if cell.frame.contains(touchPoint) {
                let cellIndex = cell.tag
                cellGridController.currentGenArray[cellIndex].toggle()
                if cell.backgroundColor == UIColor.clear {
                    cell.backgroundColor = UIColor.black
                } else {
                    cell.backgroundColor = UIColor.clear
                }
                break
            }
        }
    }
    
    /// Used to update the grid to the current generation of life; iterates through each cell and checks Bool value
    @objc func updateGrid() {
        cellGridController.buildNextGenArray()
        cellGridController.buildCurrentGenArray()
        for label in labelArray {
            let cellIndex = label.tag
            if cellGridController.currentGenArray[cellIndex] {
                label.backgroundColor = .black
            } else {
                label.backgroundColor = .clear
            }
        }
    }
    
    // MARK: - Tracking Functions
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        defer {
            super.endTracking(touch, with: event)
        }
        guard let touch = touch else { return }
        let touchPoint = touch.location(in: self)
        
        if self.bounds.contains(touchPoint) {
            initialSetup(at: touch)
        } else {
            sendActions(for: .touchUpOutside)
        }
    }

    override func cancelTracking(with event: UIEvent?) {
        defer {
            super.cancelTracking(with: event)
        }
        sendActions(for: .touchCancel)
    }
}
