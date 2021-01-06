//
//  MenuItems.swift
//  Split the Bill
//
//  Created by Kushaan Jain on 13/7/2020.
//  Copyright © 2020 Kushaan Jain. All rights reserved.
//

import Foundation
var numberOfItems: Int = 0
var listOfItems: [MenuItems] = []
var originalListOfItems1: [MenuItems] = []
var originalListOfItems2: [MenuItems] = []

class MenuItems{
    var Price: Double = 0
    var menuName: String
    
    init(Price: Double, menuName: String){
        self.Price = Price
        self.menuName = menuName
    }
        
}
extension MenuItems: NSCopying {
    func copy(with zone: NSZone? = nil) -> Any {
        return MenuItems(Price: Price, menuName: menuName)
    }
}

