//
//  MainViewController.swift
//  conways_game_of_life
//
//  Created by Craig Swanson on 10/15/20.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - Properties
    var isRunning: Bool = false
    var timer = Timer()
    var generation = 0

    // MARK: - Outlet
    @IBOutlet var cellGrid: GridView!
    @IBOutlet var generationCountLabel: UILabel!

    // MARK: - View Controller Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        generationCountLabel.text = String(generation)
    }
    
    // MARK: - Actions
    // Go from generation to generation, repeating until Stop button is tapped.
    @IBAction func updateGrid(_ sender: Any) {
        if(isRunning) {
            timer.invalidate()
            isRunning = false
            return
        }
        timer = Timer.scheduledTimer(timeInterval: 0.33, target: self, selector: #selector(callUpdateGrid), userInfo: nil, repeats: true)
        isRunning = true
        cellGrid.isEnabled = false
    }
    
    // Stepping from generation to generation for each button tap
    @IBAction func stepSimulation(_ sender: Any) {
        if(isRunning) {
            timer.invalidate()
            isRunning = false
            return
        }
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(callUpdateGrid), userInfo: nil, repeats: false)
        cellGrid.isEnabled = false
    }
    
    @IBAction func clearGrid(_ sender: Any) {
        if(isRunning) {
            timer.invalidate()
            isRunning = false
        }
        generation = 0
        cellGrid.clearGrid()
        generationCountLabel.text = String(generation)
        cellGrid.isEnabled = true
    }
    
    // MARK: - Methods
    /// Selector for the timer; call the method from the cellGrid file and increment gen.
    @objc func callUpdateGrid() {
        cellGrid.updateGrid()
        // increment generation number
        generation += 1
        generationCountLabel.text = String(generation)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
