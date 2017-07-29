//
//  DetailTableViewController.swift
//  Contacts
//
//  Created by Chris Smith on 29/07/2017.
//  Copyright © 2017 CDSApps. All rights reserved.
//

import UIKit

class DetailTableViewController: UITableViewController {
    
    var firstname = String()
    var surname = String()
    var contactTitle = String()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        let firstNameLabel = cell?.viewWithTag(1) as! UILabel
        firstNameLabel.text = firstname
        
        let surnameLabel = cell?.viewWithTag(2) as! UILabel
        surnameLabel.text = surname
        
        let contactTitleLabel = cell?.viewWithTag(3) as! UILabel
        contactTitleLabel.text = contactTitle
        
        return cell!
    }

}
