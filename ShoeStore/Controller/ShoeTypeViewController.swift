//
//  ShoeTypeViewController.swift
//  ShoeStore
//
//  Created by Claudia Maciel on 1/26/21.
//

import UIKit

class ShoeTypeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet var shoeCategoryLabel: UILabel!
    @IBOutlet var shoesCollectionView: UICollectionView!
    
    var shoes = [Shoe]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        shoesCollectionView.dataSource = self
        shoesCollectionView.delegate = self
        
        // Add cart button
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "cart"), style: .plain, target: self, action: #selector(openCart))
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
            
            // add a button
            cell.button.tag = indexPath.row
            cell.button.addTarget(self,
                                  action: #selector(self.addToCartButtonPressed(sender:)),
                                  for: .touchUpInside)
            
            return cell
        } else {
            return ShoesCollectionViewCell()
        }
    }
    
    @objc func openCart() {
        print("Cart button pressed")
        let cartVC = storyboard?.instantiateViewController(withIdentifier: "CartViewController") as? CartViewController
        //cartVC?.shoesInCart = DataService.instance.getCartItems()
//        shoeVC?.initShoes(category: category)
//        
//        let barButton = UIBarButtonItem()
//        barButton.title = ""
//        navigationItem.backBarButtonItem = barButton
        
        self.navigationController?.pushViewController(cartVC!, animated: true)
    }
    
    @objc func addToCartButtonPressed(sender: UIButton) {
        let shoePicked = shoes[sender.tag]
        
        if shoePicked.added == true {
            shoes[sender.tag].added = false
            DataService.instance.changeItemQuantity(shoe: shoePicked, quantity: 0)
        } else {
            shoes[sender.tag].added = true
            DataService.instance.addItemToCart(shoe: shoePicked)
        }
        self.shoesCollectionView.reloadData()
    }
}

