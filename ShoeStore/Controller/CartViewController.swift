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
    var total = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cartTableView.delegate = self
        cartTableView.dataSource = self
        
        shoesInCart = DataService.instance.getCartItems()
        initCart()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoesInCart.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CartCell") as? ShoppingCartTableViewCell {
            let shoe = shoeArray[indexPath.row]
            let quantity = shoesInCart[shoe]
            
            cell.updateViews(shoe: shoe, quantity: quantity!)
            
            cell.minusButton.tag = indexPath.row
            cell.minusButton.addTarget(self, action: #selector(self.addOrSubtract(sender: <#UIButton#>, mathToDo: "-")), for: .touchUpInside)
            cell.plusButton.tag = indexPath.row
            cell.plusButton.addTarget(self, action: #selector(self.addOne(sender:)), for: .touchUpInside)
            
            return cell
        } else {
            return ShoppingCartTableViewCell()
        }
    }
    
    func initCart() {
        shoeArray = Array(shoesInCart.keys)
        
        getTotal()
        TotalLabel.text = "Total: $\(total)"
    }
    
    func getTotal() {
        total = 0
        for (key, value) in shoesInCart {
            total += key.price * value
        }
    }
    
    @objc func addOrSubtract(sender: UIButton, mathToDo: String) {
        var shoePicked = shoeArray[sender.tag]
        let quantity = shoesInCart[shoePicked]! - 1
        
        DataService.instance.changeItemQuantity(shoe: &shoePicked, quantity: quantity)
        shoesInCart = DataService.instance.getCartItems()
        initCart()
        self.cartTableView.reloadData()
    }
    
    @objc func addOne(sender: UIButton) {
        var shoePicked = shoeArray[sender.tag]
        let quantity = shoesInCart[shoePicked]! + 1
        
        DataService.instance.changeItemQuantity(shoe: &shoePicked, quantity: quantity)
        shoesInCart = DataService.instance.getCartItems()
        initCart()
        self.cartTableView.reloadData()
    }

}
