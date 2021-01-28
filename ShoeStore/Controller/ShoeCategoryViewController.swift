//
//  ViewController.swift
//  ShoeStore
//
//  Created by Claudia Maciel on 1/26/21.
//

import UIKit

class ShoeCategoryViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
   
    @IBOutlet var shoeCategoryView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        shoeCategoryView.delegate = self
        shoeCategoryView.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DataService.instance.getCategories().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as? CategoryCollectionViewCell {
            let category = DataService.instance.getCategories()[indexPath.row]
            cell.updateViews(category: category)
            
            // add a border
            cell.layer.borderColor = #colorLiteral(red: 0.725119672, green: 0.6849990046, blue: 0.6422150068, alpha: 1)
            cell.layer.borderWidth = 1
            cell.layer.cornerRadius = 8
            
            return cell
        } else {
            return CategoryCollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let category = DataService.instance.getCategories()[indexPath.row]
        let shoeVC = storyboard?.instantiateViewController(withIdentifier: "ShoeTypeViewController") as? ShoeTypeViewController
        shoeVC?.initShoes(category: category)
        
        let barButton = UIBarButtonItem()
        barButton.title = ""
        navigationItem.backBarButtonItem = barButton
        
        self.navigationController?.pushViewController(shoeVC!, animated: true)
    }
}
