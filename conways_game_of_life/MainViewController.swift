//
//  MainViewController.swift
//  conways_game_of_life
//
//  Created by Craig Swanson on 10/15/20.
//

import UIKit

class MainViewController: UIViewController {
    
    var isRunning: Bool = false
    var timer = Timer()

    @IBOutlet var cellGrid: GridView!


    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func updateGrid(_ sender: Any) {
        if(isRunning) {
            timer.invalidate()
            isRunning = false
            return
        }
        timer = Timer.scheduledTimer(timeInterval: 0.33, target: self, selector: #selector(callUpdateGrid), userInfo: nil, repeats: true)
        isRunning = true
    }
    
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
