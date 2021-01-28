//
//  ShoeTypeViewController.swift
//  ShoeStore
//
//  Created by Claudia Maciel on 1/26/21.
//

import UIKit

class ShoeTypeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet var shoesCollectionView: UICollectionView!
    var shoes = [Shoe]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        shoesCollectionView.dataSource = self
        shoesCollectionView.delegate = self
    }
    
    func initShoes(category: Category) {
        shoes = DataService.instance.getProducts(forCategoryTitle: category.title)
        navigationItem.title = category.title
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shoes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShoeCell", for: indexPath) as? ShoesCollectionViewCell {
            let shoe = shoes[indexPath.row]
            cell.updateViews(shoe: shoe)
            // add a border
            cell.layer.borderColor = #colorLiteral(red: 0.725119672, green: 0.6849990046, blue: 0.6422150068, alpha: 1)
            cell.layer.borderWidth = 1
            cell.layer.cornerRadius = 8
            
            return cell
        } else {
            return ShoesCollectionViewCell()
        }
    }
}

