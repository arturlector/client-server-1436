//
//  DisplayFriendsViewController.swift
//  client-server-1436
//
//  Created by Artur Igberdin on 12.08.2021.
//

import UIKit

class DisplayFriendsViewController: UITableViewController {

    let friendsAPI = FriendsAPI()
    var friends: [FriendDynamic] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")

        friendsAPI.getFriends { [weak self] users in
            
            self?.friends = users
            self?.tableView.reloadData()
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return friends.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let friend: FriendDynamic = friends[indexPath.row]
        
        cell.textLabel?.text = "\(friend.firstName) \(friend.lastName)"
        
        return cell
    }

}
