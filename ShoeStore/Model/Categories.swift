//
//  Categories.swift
//  ShoeStore
//
//  Created by Claudia Maciel on 1/26/21.
//

import Foundation

struct Category {
    private(set) public var title: String
    
    init(title: String, imageName: String) {
        self.title = title
    }
}
