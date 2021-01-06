//
//  UserObject.swift
//  Split the Bill
//
//  Created by Kushaan Jain on 13/7/2020.
//  Copyright © 2020 Kushaan Jain. All rights reserved.
//

import Foundation


var numberOfPeople: Int = 0
var users = [UserObject]()
var originalUsers1 = [UserObject]()
var originalUsers2 = [UserObject]()
var originalUsers3 = [UserObject]()
var originalUsers4 = [UserObject]()
var originalUsers5 = [UserObject]()
var originalUsers6 = [UserObject]()
var originalUsers7 = [UserObject]()

class UserObject{
    var username: String
    var moneyOwed: Double
    
    init(username: String, moneyOwed: Double){
        self.username = username
        self.moneyOwed = moneyOwed
    }

    
}
extension UserObject: NSCopying {
    func copy(with zone: NSZone? = nil) -> Any {
        return UserObject(username: username, moneyOwed: moneyOwed)
    }
}
extension Array where Element: NSCopying {
      func copy() -> [Element] {
            return self.map { $0.copy() as! Element }
      }
}
