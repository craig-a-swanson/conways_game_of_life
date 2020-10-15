//
//  GridView.swift
//  conways_game_of_life
//
//  Created by Craig Swanson on 10/15/20.
//

import UIKit

@IBDesignable
class GridView: UIView {

    private let cellsPerRow: Int = 5

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.clear
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        backgroundColor = UIColor.cyan
    }

    override func draw(_ rect: CGRect) {

        let gridSize: CGFloat = rect.size.width
        let cellSize: CGFloat = gridSize / CGFloat(cellsPerRow)

        for row in 0..<cellsPerRow {
            for column in 0..<cellsPerRow {
                let cellSquare = CGRect(x: CGFloat(CGFloat(column) * cellSize), y: CGFloat(CGFloat(row) * cellSize), width: cellSize, height: cellSize)
                addRectangle(addRect: cellSquare, withColor: UIColor.black)
            }
        }
    }

    func addRectangle(addRect rectangle: CGRect, withColor color: UIColor) {
        if let context = UIGraphicsGetCurrentContext() {
            context.addRect(rectangle)
            context.setFillColor(color.cgColor)
            context.fillPath()
        }
    }

}
