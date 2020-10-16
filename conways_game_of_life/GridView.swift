//
//  GridView.swift
//  conways_game_of_life
//
//  Created by Craig Swanson on 10/15/20.
//

import UIKit

@IBDesignable
class GridView: UIControl {

    private let cellsPerRow: Int = 25
    private var currentGenArray: [Bool] = []
    private var labelArray: [UILabel] = []
    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        backgroundColor = UIColor.clear
//    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        backgroundColor = UIColor.cyan
    }

    override func draw(_ rect: CGRect) {

        currentGenArray = Array(repeating: false, count: cellsPerRow * cellsPerRow)
        let gridSize: CGFloat = rect.size.width
        let cellSize: CGFloat = gridSize / CGFloat(cellsPerRow)

        var index = 0
        for row in stride(from: CGFloat(0), through: CGFloat(cellsPerRow - 1), by: 1) {
            for column in stride(from: CGFloat(0), through: CGFloat(cellsPerRow - 1), by:1) {
//                create a row of labels with the appropriate size and background color
//                set the tag on the label equal to Int(row * column)
                let newCellLabel = UILabel(frame: CGRect(x: column * cellSize, y: row * cellSize, width: cellSize, height: cellSize))
                newCellLabel.tag = Int((row + 1) * column)

                var cellColor = UIColor.clear
                if currentGenArray[index] {
                    cellColor = UIColor.black
                }
                index += 1
                newCellLabel.backgroundColor = cellColor
                newCellLabel.layer.borderWidth = 0.5
                newCellLabel.layer.borderColor = UIColor.darkGray.cgColor
                addSubview(newCellLabel)
                labelArray.append(newCellLabel)
            }
        }
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
    }

//    func addRectangle(addRect rectangle: CGRect, withColor color: UIColor) {
//        if let context = UIGraphicsGetCurrentContext() {
//            context.addRect(rectangle)
//            context.setFillColor(color.cgColor)
//            context.fillPath()
//        }
//    }
    
    private func initialSetup(at touch: UITouch) {
        let touchPoint = touch.location(in: self)
        
        for cell in labelArray {
            if cell.frame.contains(touchPoint) {
                let cellIndex = cell.tag
                currentGenArray[cellIndex].toggle()
                if cell.backgroundColor == UIColor.clear {
                    cell.backgroundColor = UIColor.black
                } else {
                    cell.backgroundColor = UIColor.clear
                }
            }
        }
    }
    
    // MARK: - Tracking Functions
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
//        initialSetup(at: touch)
//        sendActions(for: .touchDown)
        
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        
        if self.bounds.contains(touchPoint) {
//            initialSetup(at: touch)
//            sendActions(for: [.touchDragInside, .valueChanged])
        } else {
            sendActions(for: .touchDragOutside)
        }
        
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
            sendActions(for: [.touchUpInside, .valueChanged])
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
