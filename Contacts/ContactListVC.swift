//
//  ContactListVC.swift
//  Contacts
//
//  Created by Chris Smith on 28/07/2017.
//  Copyright © 2017 CDSApps. All rights reserved.
//

import UIKit
import Alamofire
import CoreData

struct Contact {
    let firstName: String
    let surname: String
    let contactTitle: String
    let address: String
    let phoneNo: String
    let email: String
    let updatedAt: String
    let createdAt: String
    
}

class ContactListVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
        // UI Connections
        @IBOutlet weak var tableView: UITableView!
    
        // Properties
        var contacts = [Contact]()
        var searchURL = "http://demomedia.co.uk/files/contacts.json"
    
    var firstName = String()
    var surname = String()
    var contactTitle = String()
    var address = String()
    var phoneNo = String()
    var email = String()
    var updated = String()
    var created = String()
    
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
                        firstName = firstnameString
                        
                        let surnameString = item["surname"] as! String
                        surname = surnameString
                        
                        let titleString = item["title"] as! String
                        contactTitle = titleString
                        
                        let addressString = item["address"] as! String
                        address = addressString
                        
                        let phoneNoString = item["phoneNumber"] as! String
                        phoneNo = phoneNoString
                        
                        let emailString = item["email"] as! String
                        email = emailString
                        
                        // Created at time
                        if let createdAt = item["createdAt"] as? String{
                        let createdAtTime = Int(createdAt)
                        
                        let date = NSDate(timeIntervalSince1970: TimeInterval(createdAtTime!))
                        let dayTimePeriodFormatter = DateFormatter()
                        dayTimePeriodFormatter.dateFormat = "dd MMM hh:mm a"
                        let createdDateString = dayTimePeriodFormatter.string(from: date as Date)
                        
                        created = createdDateString
                            
                        // Updated at time
                        if let updatedAt = item["createdAt"] as? String{
                        let updatedAtTime = Int(updatedAt)
                        
                        let date = NSDate(timeIntervalSince1970: TimeInterval(updatedAtTime!))
                        let dayTimePeriodFormatter = DateFormatter()
                        dayTimePeriodFormatter.dateFormat = "dd MMM hh:mm a"
                        let updatedDateString = dayTimePeriodFormatter.string(from: date as Date)
                        
                        updated = updatedDateString
                        
                            contacts.append(Contact(firstName: firstnameString, surname: surnameString, contactTitle: titleString, address: addressString, phoneNo: phoneNoString, email: emailString, updatedAt: updatedDateString, createdAt: createdDateString))
                        tableView.reloadData()
                        saveToCoreData()
                      }
                     }
                    }
                  }catch {
                print(error)
            }
        }
    
    
        // CoreData
    func saveToCoreData(){
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    let contact = Contacts(context: context)
    contact.firstName = firstName
    contact.surname = surname
    contact.address = address
    contact.contactTitle = contactTitle
    contact.phoneNumber = phoneNo
    contact.email = email
    contact.updatedAt = updated
    contact.createdAt = created
        
    (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
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
        vc.created = contacts[indexPath!].createdAt
        vc.updated = contacts[indexPath!].updatedAt
        
        
    }
}


































