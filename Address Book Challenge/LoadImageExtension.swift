//
//  LoadImageExtension.swift
//  Address Book Challenge
//
//  Created by Christopher Nusaputra on 2017-01-30.
//  Copyright © 2017 Chris Nusa. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView
{
    func loadImage(url: URL?)
    {
        self.image = nil
        
        if url != nil
        {
            let task = URLSession.shared.dataTask(with: url!)
            { (data, response, error) in
                
                DispatchQueue.main.async
                    {
                        if data != nil && error == nil
                        {
                            if let image = UIImage(data: data!)
                            {
                                self.image = image
                            }
                        }
                }
            }
            task.resume()
        }
    }
}
