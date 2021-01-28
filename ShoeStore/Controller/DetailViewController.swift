//
//  DetailViewController.swift
//  ShoeStore
//
//  Created by Claudia Maciel on 1/26/21.
//

import UIKit

class DetailViewController: UIViewController {
    var shoe: Shoe?
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var descriptionTextView: UITextView!
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
            // Add cart button
            navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "cart"), style: .plain, target: self, action: #selector(openCart))

    }
    func updateView() {
        guard let shoe = shoe else { return }
        nameLabel.text = shoe.name
        priceLabel.text = "$\(shoe.price)"
        descriptionTextView.text = shoe.description
        imageView.image = UIImage(named: shoe.imageName)
    }
    
    @IBAction func AddToCartButtonPressed(_ sender: Any) {
        guard let shoe = shoe else { return }
        
        DataService.instance.addItemToCart(shoe: shoe)
        
        let alert = UIAlertController(title: "\(shoe.name) ", message: "was added to cart", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    @objc func openCart() {
        print("Cart button pressed")
        let cartVC = storyboard?.instantiateViewController(withIdentifier: "CartViewController") as? CartViewController
        self.navigationController?.pushViewController(cartVC!, animated: true)
    }
    

}
