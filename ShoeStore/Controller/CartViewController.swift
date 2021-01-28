//
//  CartViewController.swift
//  ShoeStore
//
//  Created by Claudia Maciel on 1/26/21.
//

import UIKit

class CartViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var TotalLabel: UILabel!
    @IBOutlet var cartTableView: UITableView!
    
    var shoesInCart = [Shoe: Int]()
    var shoeArray  = [Shoe]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cartTableView.delegate = self
        cartTableView.dataSource = self
        
        shoesInCart = DataService.instance.getCartItems()
        shoeArray = Array(shoesInCart.keys)
        // navigationItem.title = category.title
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoesInCart.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CartCell") as? ShoppingCartTableViewCell {
            let shoe = shoeArray[indexPath.row]
            let quantity = shoesInCart[shoe]
            
            cell.updateViews(shoe: shoe, quantity: quantity!)
            return cell
        } else {
            return ShoppingCartTableViewCell()
        }
    }

}
