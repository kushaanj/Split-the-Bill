//
//  UserCell.swift
//  Split the Bill
//
//  Created by Kushaan Jain on 31/8/2020.
//  Copyright © 2020 Kushaan Jain. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {


    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var payButton: UIButton!
    @IBOutlet weak var priceLabel: UILabel!
    
    func setUser(user: UserObject){
        nameLabel.text = user.username
        priceLabel.text = String(user.moneyOwed)
        payButton.setTitle("PAY", for: .normal)
        
    }

    @IBAction func payButton(_ sender: Any) {
        payButton.setTitle("PAID", for: .normal)
        payButton.setTitleColor(.green, for: .normal)
    }
    
}
