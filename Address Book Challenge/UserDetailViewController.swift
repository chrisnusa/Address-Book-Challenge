//
//  UserDetailViewController.swift
//  Address Book Challenge
//
//  Created by Christopher Nusaputra on 2017-01-30.
//  Copyright © 2017 Chris Nusa. All rights reserved.
//

import Foundation
import UIKit

class UserDetailViewController: UIViewController
{
    var user: RandomUserData?
    
    @IBOutlet weak var userImageLarge: UIImageView!
    @IBOutlet weak var fullName: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var dateOfBirth: UILabel!
 
    override func viewDidLoad()
    {
        self.userImageLarge.loadImage(url: self.user?.largePictureURL)
        self.fullName.text = self.user?.name
        self.address.text = self.user?.address
        self.city.text = self.user?.city
        self.email.text = self.user?.email
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        self.dateOfBirth.text = dateFormatter.string(from: (self.user?.dateOfBirth)!)
    }
    
    func setUser(randomUser: RandomUserData)
    {
        self.user = randomUser
    }
}
