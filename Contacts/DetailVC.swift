//
//  DetailViewController.swift
//  Contacts
//
//  Created by Chris Smith on 29/07/2017.
//  Copyright © 2017 CDSApps. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {

    var firstname = String()
    var surname = String()
    var contactTitle = String()
    var address = String()
    var phoneNo = String()
    
    
    @IBOutlet weak var contactTitleLabel: UILabel!
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var phoneNumLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        contactTitleLabel.text = contactTitle
        firstNameLabel.text = firstname
        surnameLabel.text = surname
        addressLabel.text = address
        phoneNumLabel.text = phoneNo
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}