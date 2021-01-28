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
    @IBOutlet var button: UIButton!
    
    
    func updateViews(shoe: Shoe) {
        shoeImage.image = UIImage(named: shoe.imageName)
        shoeName.text = shoe.name
        shoePrice.text = "$\(shoe.price)"
        
        if shoe.added == false {
            button.setImage(UIImage(systemName: "heart"), for: .normal)
        } else {
            button.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        }
    }
}
