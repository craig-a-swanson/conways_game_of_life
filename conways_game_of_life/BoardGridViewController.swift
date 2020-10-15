//
//  BoardGridViewController.swift
//  conways_game_of_life
//
//  Created by Craig Swanson on 10/14/20.
//

import UIKit

class BoardGridViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    let testGrid = Array(repeating: 1, count: 25)
    
    @IBOutlet var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .cyan
    }
    
    // MARK: - UICollection View Data Source
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return testGrid.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "lifeCell", for: indexPath)
        
        let cellState = testGrid[indexPath.item]
        if cellState == 1 {
            print(cellState)
            cell.backgroundColor = .blue
        } else {
            cell.backgroundColor = .red
        }
        return cell
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
