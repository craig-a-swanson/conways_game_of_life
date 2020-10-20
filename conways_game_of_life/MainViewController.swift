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

    // MARK: - Outlet
    @IBOutlet var cellGrid: GridView!

    // MARK: - View Controller Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
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
    }
    
    // Stepping from generation to generation for each button tap
    @IBAction func stepSimulation(_ sender: Any) {
        if(isRunning) {
            timer.invalidate()
            isRunning = false
            return
        }
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(callUpdateGrid), userInfo: nil, repeats: false)
    }
    
    // MARK: - Methods
    /// Selector for the timer, only use is to call the method from the cellGrid file.
    @objc func callUpdateGrid() {
        cellGrid.updateGrid()
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
