//
//  DetailViewController.swift
//  Contacts
//
//  Created by Chris Smith on 29/07/2017.
//  Copyright © 2017 CDSApps. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var firstname = String()
    var surname = String()
    var contactTitle = String()
    
    
    @IBOutlet weak var contactTitleLabel: UILabel!
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        contactTitleLabel.text = contactTitle
        firstNameLabel.text = firstname
        surnameLabel.text = surname
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
