//
//  UserInfoViewController.swift
//  HW4_1
//
//  Created by Nikita Zharinov on 06/02/2021.
//

import UIKit

class UserInfoViewController: UIViewController {

    var person: Person?

    @IBOutlet var userNameLabel: UILabel!
    
    @IBOutlet var personImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        userNameLabel.text = "Welcome, \(String(describing: account?.person.personName))"
        
//        \(account!.person.personName) \(account!.person.personSurname)"
//        personImage.image = UIImage(named: (account!.person.personImage))
    }
}
