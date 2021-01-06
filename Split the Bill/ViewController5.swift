//
//  ViewController5.swift
//  Split the Bill
//
//  Created by Kushaan Jain on 17/7/2020.
//  Copyright © 2020 Kushaan Jain. All rights reserved.
//

import UIKit

class ViewController5: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    var pickerData: [String] = [String]()
    var selectedName: String = ""
    var selectedNames: [String] = [String]()
    var selectedNamesLocations: [Int] = [Int]()
    var selectedMenuItem: Int = 0
    var namesString: String = ""
    
    
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
        selectedName = pickerData[row]
    }
    @IBOutlet weak var menuItemLabel: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        originalUsers5 = users.copy()

        self.namesPickerView.delegate = self
        self.namesPickerView.dataSource = self
        
        pickerData.append("-")
        
        for i in 0..<numberOfPeople{
            pickerData.append(users[i].username)
        }
        
        menuItemLabel.text = listOfItems[selectedMenuItem].menuName

        // Do any additional setup after loading the view.
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(sender:)))
        rightSwipe.direction = .right
        
        view.addGestureRecognizer(rightSwipe)
    }
    
    
    @IBOutlet weak var namesPickerView: UIPickerView!
    
    @objc func handleSwipe(sender: UISwipeGestureRecognizer){
        if sender.state == .ended{
            users = originalUsers4.copy()
            listOfItems = originalListOfItems2.copy()
            self.performSegue(withIdentifier: "backsegue4", sender: self)
                
        }
    }
    
    // MARK: - Navigation

     @IBAction func addNameButton(_ sender: Any) {
        selectedName = pickerData[namesPickerView.selectedRow(inComponent: 0)]
        if (selectedName != "-") && (selectedName != "") {
            var selectedUser: Int = 0
            for i in 0..<numberOfPeople{
                if selectedName == users[i].username{
                    selectedUser = i
                    selectedNamesLocations.append(selectedUser)
                }
            }

            var pickerDataUserToDelete: Int = -1
            for i in 0..<pickerData.count{
                if selectedName == pickerData[i]{
                    pickerDataUserToDelete = i
                }
            }

            pickerData.remove(at: pickerDataUserToDelete)
        
            selectedNames.append(selectedName)
            namesString = namesString + selectedName + ", "
            listOfNamesLabel.text = namesString
            namesPickerView.reloadAllComponents()
        }
     }
    @IBAction func confirmNamesButton(_ sender: Any) {
        let doubleNumberOfNames: Double = Double(selectedNames.count)
        if doubleNumberOfNames != 0{
            let splitPrice: Double = listOfItems[selectedMenuItem].Price/doubleNumberOfNames
            for i in 0..<selectedNamesLocations.count{
                users[selectedNamesLocations[i]].moneyOwed = users[selectedNamesLocations[i]].moneyOwed + splitPrice
            }
            
            selectedMenuItem = selectedMenuItem + 1
            if selectedMenuItem == numberOfItems{
                self.performSegue(withIdentifier: "segue5", sender: self)
            }
            else{
                pickerData.removeAll()
                pickerData.append("-")
                for i in 0..<numberOfPeople{
                    pickerData.append(users[i].username)
                }
                namesPickerView.reloadAllComponents()
                menuItemLabel.text = listOfItems[selectedMenuItem].menuName
                listOfNamesLabel.text = ""
                selectedName = ""
                selectedNames.removeAll()
                selectedNamesLocations.removeAll()
                namesString = ""
                
            }
        
        }
    }
    @IBOutlet weak var listOfNamesLabel: UILabel!
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
