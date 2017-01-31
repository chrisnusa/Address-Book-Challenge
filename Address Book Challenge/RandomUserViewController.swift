//
//  FirstViewController.swift
//  Address Book Challenge
//
//  Created by Christopher Nusaputra on 2017-01-30.
//  Copyright © 2017 Chris Nusa. All rights reserved.
//

import UIKit

class RandomUserViewController: UITableViewController
{
    
    var randomUsers: Array<RandomUserData>?
    
    override func viewWillAppear(_ animated: Bool)
    {
        self.reloadData()
    }
    
    override func viewDidLoad()
    {
        //self.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.randomUsers?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RandomUserCell") as! RandomUserTableViewCell
        cell.setRandomUserData(randomUserData: (self.randomUsers?[indexPath.row])!)
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        let userDetailTableView = segue.destination as! UserDetailViewController
        let userIndexPath = self.tableView.indexPath(for: (sender as! UITableViewCell))!
        
        userDetailTableView.setUser(randomUser: (self.randomUsers?[userIndexPath.row])!)
    }
    
    func reloadData()
    {
        let numberOfPersons = UserDefaults.standard.float(forKey: "num_person")
        
        if let url = RandomUserApiManager.getRandomUserURL(source: Int(floor(numberOfPersons)))
        {
            processURL(url: url)
        }
        else
        {	self.tableView?.refreshControl?.endRefreshing()
        }
    }
    
    func processURL(url: URL)
    {
        let session = URLSession.shared
        
        let task = session.dataTask(with: url)
        { (data, response, error) in
            
            let randomUserData = JSON(data: data!)
            let randomUserJSONArray = randomUserData["results"].arrayValue
            
            self.randomUsers = Array<RandomUserData>()
            
            for UserJSON in randomUserJSONArray
            {
                self.randomUsers?.append(RandomUserData(randomUserJSON: UserJSON))
            }
            
            DispatchQueue.main.async
                {	self.tableView?.refreshControl?.endRefreshing()
                    self.tableView?.reloadData()
            }
            
        }
        task.resume()
    }
}

