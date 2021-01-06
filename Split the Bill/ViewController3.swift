//
//  ViewController3.swift
//  Split the Bill
//
//  Created by Kushaan Jain on 15/7/2020.
//  Copyright © 2020 Kushaan Jain. All rights reserved.
//

import UIKit

class ViewController3: UIViewController {
    
    public var numberOfItemsString: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        originalUsers3 = users.copy()
        originalListOfItems1 = listOfItems.copy()

        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(sender:)))
        rightSwipe.direction = .right
        
        view.addGestureRecognizer(rightSwipe)

        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var outputField: UITextField!
    
    @objc func handleSwipe(sender: UISwipeGestureRecognizer){
        if sender.state == .ended{
            users = originalUsers2.copy()
            self.performSegue(withIdentifier: "backsegue2", sender: self)
             
        }
    }
 
    
    @IBAction func confirmButton(_ sender: Any) {
        numberOfItemsString = outputField.text ?? "0"
        numberOfItems = Int(numberOfItemsString) ?? 0
        
        if numberOfItems > 0{
            for _ in 0..<numberOfItems{
                listOfItems.append(MenuItems(Price: 0, menuName: "-"))
            }
            self.performSegue(withIdentifier: "segue3", sender: self)
        }
        
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
