//
//  RandomUserData.swift
//  Address Book Challenge
//
//  Created by Christopher Nusaputra on 2017-01-30.
//  Copyright © 2017 Chris Nusa. All rights reserved.
//

import Foundation

class RandomUserData
{
    let name: String
    let address: String
    let city: String
    let email: String
    let mediumPictureURL: URL?
    let largePictureURL: URL?
    let dateOfBirth: Date
    
    init(randomUserJSON: JSON)
    {
        self.name = randomUserJSON["name"]["first"].stringValue + " " + randomUserJSON["name"]["last"].stringValue
        self.address = randomUserJSON["location"]["street"].stringValue
        self.city = randomUserJSON["location"]["city"].stringValue
        self.email = randomUserJSON["email"].stringValue
        self.mediumPictureURL = randomUserJSON["picture"]["medium"].URL
        self.largePictureURL = randomUserJSON["picture"]["large"].URL
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        self.dateOfBirth = dateFormatter.date(from: randomUserJSON["dob"].stringValue) ?? Date()
    }
}
