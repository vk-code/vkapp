//
//  FriendsController.swift
//  vkapp
//
//  Created by Vasiliy Kapyshkov on 16.01.2021.
//

import UIKit

class FriendsController: UITableViewController {

    private var friendsList = [
        User(name: "Chandler"),
        User(name: "Phoebe"),
        User(name: "Rachel"),
        User(name: "Joey"),
        User(name: "Monica"),
        User(name: "Ross"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendsList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "friendCell", for: indexPath)
        guard let friendCell = cell as? FriendsTableCell else { return cell }
        
        let friendData = friendsList[indexPath.row]
        friendCell.name?.text = friendData.name
        friendCell.photo?.image = friendData.photo
        
        return friendCell
    }

    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let userVC = segue.destination as? UserController else { return }
        guard let selectedRow = tableView.indexPathForSelectedRow else { return }
        
        if let photo = friendsList[selectedRow.row].photo {
            userVC.userPhoto = photo
        }
    }
    

}
