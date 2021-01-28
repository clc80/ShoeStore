//
//  ShoppingCartTableViewCell.swift
//  ShoeStore
//
//  Created by Claudia Maciel on 1/27/21.
//

import UIKit

class ShoppingCartTableViewCell: UITableViewCell {
    
    
    @IBOutlet var shoeImage: UIImageView!
    @IBOutlet var shoeName: UILabel!
    @IBOutlet var shoePrice: UILabel!
    @IBOutlet var shoeQuantity: UILabel!
    @IBOutlet var minusButton: UIButton!
    @IBOutlet var plusButton: UIButton!
    

    func updateViews(shoe: Shoe, quantity: Int) {
        shoeImage.image = UIImage(named: shoe.imageName)
        shoeName.text = shoe.name
        shoePrice.text = "$\(shoe.price)"
        shoeQuantity.text = "\(quantity)"
        
    }
    @IBAction func plusButtonPressed(_ sender: Any) {
        
    }
    @IBAction func minusButtonPressed(_ sender: Any) {
        
    }
    
}
