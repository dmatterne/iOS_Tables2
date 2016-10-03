//
//  ViewController.swift
//  Tables2
//
//  Created by Stannis Baratheon on 03/10/16.
//  Copyright © 2016 Training. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    var listData: [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        listData = ["Mac Plus", "Bondi iMac", "iMac Flat Panel" , "Mac Pro" , "Mac Mini" , "iMac Aluminium" , "PowerBook 100" , "PowerBook Duo" , "PowerBook G4", "White MacBook" , "MacBook 13" , "MacBook Air"]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return listData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SimpleTableIdentifier", for: indexPath)
        
        cell.textLabel?.text = listData[indexPath.row]
        
        let imageName = listData[indexPath.row] as String
        let fullName = imageName + ".png"
        let image = UIImage(named: fullName)
        
        cell.imageView?.image = image
        
        if indexPath.row < 6 {
        
            cell.detailTextLabel?.text = "Desktop"
            
        } else {
        
            cell.detailTextLabel?.text = "Portable"
        
        }
        
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        let row = indexPath.row
        
        if row < 6 {
            return nil
        }
        
        return indexPath
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        let rowValue = listData[row]
        let message = "You selected \(rowValue)"
        
        let myAlert = UIAlertController(title: "Row Selected", message: message, preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "OK", style: .default) { (UIAlertAction) in
            print("OK Pressed")
        }
        
        myAlert.addAction(ok)
        
        
        
        present(myAlert, animated: true, completion: nil)
        tableView.deselectRow(at: indexPath, animated: true)
        
        
    }

}

