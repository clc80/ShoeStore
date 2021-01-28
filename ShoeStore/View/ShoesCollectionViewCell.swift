//
//  ShoesCollectionViewCell.swift
//  ShoeStore
//
//  Created by Claudia Maciel on 1/27/21.
//

import UIKit

class ShoesCollectionViewCell: UICollectionViewCell {
    @IBOutlet var shoeImage: UIImageView!
    @IBOutlet var shoeName: UILabel!
    @IBOutlet var shoePrice: UILabel!
    
    
    func updateViews(shoe: Shoe) {
        shoeImage.image = UIImage(named: shoe.imageName)
        shoeName.text = shoe.name
        shoePrice.text = "$\(shoe.price)"
    }
    
    @IBAction func AddToCartButton(_ sender: Any) {
        print("heart pressed")
    }
    
    
}
