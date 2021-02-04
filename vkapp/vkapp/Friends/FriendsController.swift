//
//  FriendsController.swift
//  vkapp
//
//  Created by Vasiliy Kapyshkov on 16.01.2021.
//

import UIKit

class FriendsController: UITableViewController {

    @IBOutlet var searchBar: UISearchBar?
    
    private var friendsArr = [
        User(name: "Chandler"),
        User(name: "Phoebe"),
        User(name: "Rachel"),
        User(name: "Joey"),
        User(name: "Monica"),
        User(name: "Ross"),
    ]
    private var friendsList = [User]()
    private var sectionsList = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        friendsList = friendsArr
        tableView.register(UINib(nibName: "CustomSectionHeader", bundle: .main), forHeaderFooterViewReuseIdentifier: "cellHeader")
        getSections()
    }

    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return sectionsList.count
    }
    
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "cellHeader") as? CustomSectionHeader
        headerView?.labelView?.text = sectionsList[section]
        headerView?.tintColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        return headerView
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let firstLetter = sectionsList[section]
        var count = 0
        
        for user in friendsList {
            if user.firstNameLetter == firstLetter {
                count += 1
            }
        }
        return count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "friendCellCustom", for: indexPath)
        guard let friendCell = cell as? FriendsTableCell else { return cell }
        
        var userData: User?
        let nameStartsWith = sectionsList[indexPath.section]
        
        for (index, user) in friendsList.enumerated() {
            if user.firstNameLetter == nameStartsWith && !user.presentedInTable {
                userData = user
                friendsList[index].presentedInTable = true
                break
            }
        }
        
        guard let friendData = userData else { return cell }
        
        friendCell.name?.text = friendData.name
        friendCell.avatar?.setPhoto(friendData.photo)
        
        return friendCell
    }
    
    
    private func getSections() {
        sectionsList.removeAll()
        for user in friendsList {
            if !sectionsList.contains(user.firstNameLetter) {
                sectionsList.append(user.firstNameLetter)
            }
        }
    }

    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        guard let userVC = segue.destination as? UserController else { return }
//        guard let selectedRow = tableView.indexPathForSelectedRow else { return }
//
//        if let photo = friendsList[selectedRow.row].photo {
//            userVC.userPhoto = photo
//        }
    }
    

}


extension FriendsController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        friendsList = searchText.isEmpty ? friendsArr : friendsList.filter({ element in
            return element.name.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
        })
        
        for (index, _) in friendsList.enumerated() {
            friendsList[index].presentedInTable = false
        }
        
        getSections()
        tableView.reloadData()
    }
}
