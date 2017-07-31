//
//  DetailViewController.swift
//  Contacts
//
//  Created by Chris Smith on 29/07/2017.
//  Copyright © 2017 CDSApps. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {

    // MARK: - Properties
    var firstname = String()
    var surname = String()
    var contactTitle = String()
    var address = String()
    var phoneNo = String()
    var email = String()
    var created = String()
    var updated = String()
    
    // MARK: - UI Element Connections
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var phoneNumLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var updatedLabel: UILabel!
    @IBOutlet weak var createdLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstNameLabel.text = "\(contactTitle) \(firstname) \(surname)"
        addressLabel.text = address
        phoneNumLabel.text = phoneNo
        emailLabel.text = email
        updatedLabel.text = "Updated: \(updated)"
        createdLabel.text = "Created: \(created)"
    }
}
