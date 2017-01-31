//
//  SecondViewController.swift
//  Address Book Challenge
//
//  Created by Christopher Nusaputra on 2017-01-30.
//  Copyright © 2017 Chris Nusa. All rights reserved.
//

import Foundation
import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var numberOfUserSlider: UISlider!
    @IBOutlet weak var numberOfUserLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool)
    {
        let numPersons = UserDefaults.standard.float(forKey: "num_person")
        
        if numPersons >= 1
        {
            numberOfUserSlider.value = numPersons
            
            self.numberOfUserSliderChanged(numberOfUserSlider)
        }
    }

    @IBAction func numberOfUserSliderChanged(_ sender: UISlider)
    {
        self.numberOfUserLabel.text = "\(Int(numberOfUserSlider.value))"
        
        UserDefaults.standard.set(numberOfUserSlider.value, forKey: "num_person")

    }
}

