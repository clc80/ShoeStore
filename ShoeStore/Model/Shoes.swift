//
//  Shoes.swift
//  ShoeStore
//
//  Created by Claudia Maciel on 1/26/21.
//

import Foundation

struct Shoe: Hashable {
    private(set) public var name: String
    private(set) public var description: String
    private(set) public var price: Int
    private(set) public var imageName: String
    
    init(name: String, description: String, price: Int, imageName: String) {
        self.name = name
        self.description = description
        self.price = price
        self.imageName = imageName
    }
}
