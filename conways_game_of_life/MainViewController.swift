//
//  MainViewController.swift
//  conways_game_of_life
//
//  Created by Craig Swanson on 10/15/20.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet var cellGrid: GridView!


    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func updateCellState(_ sender: GridView) {
        
    }
    
    @IBAction func updateGrid(_ sender: Any) {
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