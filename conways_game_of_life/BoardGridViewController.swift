//
//  BoardGridViewController.swift
//  conways_game_of_life
//
//  Created by Craig Swanson on 10/14/20.
//

import UIKit

class BoardGridViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    // MARK: - Properties
    var testGrid = Array(repeating: 1, count: 25*25)
    
    // MARK: - Outlets
    @IBOutlet var collectionView: UICollectionView!

    // MARK: - View Controller Life Cycle
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
            cell.backgroundColor = .blue
        } else {
            cell.backgroundColor = .red
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        testGrid[indexPath.item] = 2
        collectionView.reloadItems(at: [indexPath])
    }
}
