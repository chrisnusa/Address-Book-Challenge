//
//  RandomUserTableViewCell.swift
//  Address Book Challenge
//
//  Created by Christopher Nusaputra on 2017-01-30.
//  Copyright © 2017 Chris Nusa. All rights reserved.
//

import Foundation
import UIKit

class RandomUserTableViewCell: UITableViewCell
{
    @IBOutlet weak var mediumUserPicture: UIImageView!
    @IBOutlet weak var randomUserFullName: UILabel!
    
    func setRandomUserData(randomUserData: RandomUserData)
    {
        self.mediumUserPicture.loadImage(url: randomUserData.mediumPictureURL)
        self.randomUserFullName.text = randomUserData.name
    }
}
