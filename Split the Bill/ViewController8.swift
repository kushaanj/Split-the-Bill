//
//  ViewController8.swift
//  Split the Bill
//
//  Created by Kushaan Jain on 31/8/2020.
//  Copyright © 2020 Kushaan Jain. All rights reserved.
//

import UIKit

class ViewController8: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 0..<numberOfPeople{
            let x = users[i].moneyOwed
            let y: Double = (x*100).rounded()/100
            users[i].moneyOwed = y
        }
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(sender:)))
        rightSwipe.direction = .right
        
        view.addGestureRecognizer(rightSwipe)

        // Do any additional setup after loading the view.
    }
    
    @objc func handleSwipe(sender: UISwipeGestureRecognizer){
        if sender.state == .ended{
            users = originalUsers7.copy()
            self.performSegue(withIdentifier: "backsegue7", sender: self)
                
        }
    }
    
    
    @IBAction func resetButton(_ sender: Any) {
        users = []
        numberOfPeople = 0
        originalUsers1 = []
        originalUsers2 = []
        originalUsers3 = []
        originalUsers4 = []
        originalUsers5 = []
        originalUsers6 = []
        originalUsers7 = []
        
        listOfItems = []
        numberOfItems = 0
        originalListOfItems1 = []
        originalListOfItems2 = []
        
        self.performSegue(withIdentifier: "fullsegue", sender: self)
        
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
extension ViewController8: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfPeople
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let user = users[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell") as! UserCell
        
        cell.setUser(user: user)
        
        return cell
        
        
    }

}
