//
//  ContactListVC.swift
//  Contacts
//
//  Created by Chris Smith on 28/07/2017.
//  Copyright © 2017 CDSApps. All rights reserved.
//

import UIKit
import Alamofire

struct Contact {
    let firstName: String
    let surname: String
    let contactTitle: String
    let address: String
    let phoneNo: String
    let email: String
    
}

class ContactListVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
        // UI Connections
        @IBOutlet weak var tableView: UITableView!
    
        // Properties
        var contacts = [Contact]()
        var searchURL = "http://demomedia.co.uk/files/contacts.json"
    
        // Typealias
        typealias JSON = [String : AnyObject]
    
    
        override func viewDidLoad() {
            super.viewDidLoad()
            callAlamo(url: searchURL)
            tableView.delegate = self
            tableView.dataSource = self
        }
        
        
        func callAlamo(url: String){
            Alamofire.request(url).responseJSON(completionHandler: {
                response in
                self.parseData(JSONData: response.data!)
            })
        }
        
        
        func parseData(JSONData: Data){
            do {
                var readableJSON = try JSONSerialization.jsonObject(with: JSONData, options: .mutableContainers) as! [JSON]
                //print(readableJSON)

                    for i in 0..<readableJSON.count{
                        let item = readableJSON[i]
                        
                        let firstnameString = item["firstname"] as! String
                        
                        let surnameString = item["surname"] as! String
                        
                        let titleString = item["title"] as! String
                        
                        let addressString = item["address"] as! String
                        
                        let phoneNoString = item["phoneNumber"] as! String
                        
                        let emailString = item["email"] as! String
                        
                        // Created at time
                        if let createdAt = item["createdAt"] as? String{
                        let createdAtTime = Int(createdAt)
                        
                        let date = NSDate(timeIntervalSince1970: TimeInterval(createdAtTime!))
                        let dayTimePeriodFormatter = DateFormatter()
                        dayTimePeriodFormatter.dateFormat = "dd MMM hh:mm a"
                        let dateString = dayTimePeriodFormatter.string(from: date as Date)
                        print(dateString)
                        }
                            
                        // Updated at time
                        if let updatedAt = item["createdAt"] as? String{
                        let updatedAtTime = Int(updatedAt)
                        
                        let date = NSDate(timeIntervalSince1970: TimeInterval(updatedAtTime!))
                        let dayTimePeriodFormatter = DateFormatter()
                        dayTimePeriodFormatter.dateFormat = "dd MMM hh:mm a"
                        let dateString = dayTimePeriodFormatter.string(from: date as Date)
                            print("Updated at: \(dateString)")
                        }
                        
                        contacts.append(Contact(firstName: firstnameString, surname: surnameString, contactTitle: titleString, address: addressString, phoneNo: phoneNoString, email: emailString))
                        tableView.reloadData()
                    }
                  }catch {
                print(error)
            }
        }
    
    
        
        
        
        // MARK: - TableView Setup
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
            
            let firstNameLabel = cell?.viewWithTag(1) as! UILabel
            firstNameLabel.text = contacts[indexPath.row].firstName
            
            let surnameLabel = cell?.viewWithTag(2) as! UILabel
            surnameLabel.text = contacts[indexPath.row].surname
            
            return cell!
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return contacts.count
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indexPath = self.tableView.indexPathForSelectedRow?.row
        
        let vc = segue.destination as! DetailVC
        
        vc.firstname = contacts[indexPath!].firstName
        vc.surname = contacts[indexPath!].surname
        vc.contactTitle = contacts[indexPath!].contactTitle
        vc.address = contacts[indexPath!].address
        vc.phoneNo = contacts[indexPath!].phoneNo
        vc.email = contacts[indexPath!].email
        
        
    }
}


































