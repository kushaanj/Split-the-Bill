//
//  ViewController4.swift
//  Split the Bill
//
//  Created by Kushaan Jain on 16/7/2020.
//  Copyright © 2020 Kushaan Jain. All rights reserved.
//

import UIKit

class ViewController4: UIViewController {
    
    public var count: Int = 0
    public var menuItemsString: String = ""
    public var priceString: String = ""
    
    public var nameOfItem: String = ""
    public var priceOfItem: Double = 0
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        originalUsers4 = users.copy()
        originalListOfItems2 = listOfItems.copy()
        
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(sender:)))
        rightSwipe.direction = .right
        
        view.addGestureRecognizer(rightSwipe)
        

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var priceTextField: UITextField!
    
     @IBOutlet weak var errorLabel: UILabel!
     @IBOutlet weak var listLabel: UILabel!
    
    @objc func handleSwipe(sender: UISwipeGestureRecognizer){
        if sender.state == .ended{
            users = originalUsers3.copy()
            listOfItems = originalListOfItems1.copy()
            self.performSegue(withIdentifier: "backsegue3", sender: self)
                
        }
    }
    
     // MARK: - Navigation

     @IBAction func addButton(_ sender: Any) {
        var validName: Bool = true
        nameOfItem = nameTextField.text!
        priceString = priceTextField.text ?? ""
        
        nameTextField.text = ""
        priceTextField.text = ""
        
        if nameOfItem == ""{
            validName = false
            self.errorLabel.text = "This is not a valid name"
        }
        if nameOfItem == "-"{
            validName = false
            self.errorLabel.text = "This is not a valid name"
        }
        
        if priceString == ""{
            validName = false
            self.errorLabel.text = "This is not a valid price"
        }
        else{
            priceOfItem = Double(priceString) ?? 0
        }
        
        for i in 0..<numberOfItems{
            if nameOfItem == listOfItems[i].menuName{
                validName = false
                self.errorLabel.text = "This item has already been listed"
            }
        }
        if count != numberOfItems{
            if validName ==  true{
                listOfItems[count].menuName = nameOfItem
                listOfItems[count].Price = priceOfItem
                menuItemsString = menuItemsString + nameOfItem + ", "
                self.listLabel.text = menuItemsString
                self.errorLabel.text = ""
                count = count + 1
                if count == numberOfItems{
                    self.performSegue(withIdentifier: "segue4", sender: self)
                }
            }
        }
        
     }
     // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
