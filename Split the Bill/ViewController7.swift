//
//  ViewController7.swift
//  Split the Bill
//
//  Created by Kushaan Jain on 29/8/2020.
//  Copyright © 2020 Kushaan Jain. All rights reserved.
//

import UIKit

class ViewController7: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    var pickerData: [String] = [String]()
    var selectedPercentage: String = ""
    var subTotal: Double = 0
    var selectedRow: Int = 0
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // This method is triggered whenever the user makes a change to the picker selection.
        // The parameter named row and component represents what was selected.
        selectedPercentage = pickerData[row]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        originalUsers7 = users.copy()
 
        self.tipPickerView.delegate = self
        self.tipPickerView.dataSource = self
        
        for i in 0..<21{
            pickerData.append(String(i*5) + "%")
        }
        // Do any additional setup after loading the view.
        
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(sender:)))
        rightSwipe.direction = .right
        
        view.addGestureRecognizer(rightSwipe)

    }
    @IBOutlet weak var tipPickerView: UIPickerView!
    
    @objc func handleSwipe(sender: UISwipeGestureRecognizer){
        if sender.state == .ended{
            users = originalUsers6.copy()
            self.performSegue(withIdentifier: "backsegue6", sender: self)
                
        }
    }
    

    @IBAction func confirmButton(_ sender: Any) {
        selectedRow = tipPickerView.selectedRow(inComponent: 0)
        var tipMultiplier: Double = 0.05
        tipMultiplier = tipMultiplier * Double(selectedRow)
        for i in 0..<numberOfItems{
            subTotal = subTotal + listOfItems[i].Price
        }
        var tip: Double = 0
        tip = tipMultiplier * subTotal
        for i in 0..<numberOfPeople{
            users[i].moneyOwed = users[i].moneyOwed + (tip/Double(numberOfPeople))
        }
        self.performSegue(withIdentifier: "segue7", sender: self)
        
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
