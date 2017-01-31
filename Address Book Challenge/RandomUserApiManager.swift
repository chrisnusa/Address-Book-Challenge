//
//  RandomUserApiManager.swift
//  Address Book Challenge
//
//  Created by Christopher Nusaputra on 2017-01-30.
//  Copyright © 2017 Chris Nusa. All rights reserved.
//

import Foundation

class RandomUserApiManager
{
    class func getRandomUserURL(source: Int? = 1) -> URL?
    {
        let randomUserNumber = source ?? 5
        
        let urlString = "https://randomuser.me/api/?results=\(randomUserNumber)"
        
        return URL(string: urlString)
    }
}

