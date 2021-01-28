//
//  GroupsController.swift
//  vkapp
//
//  Created by Vasiliy Kapyshkov on 25.01.2021.
//

import UIKit

class GroupsController: UITableViewController {

    var userGroups = [Group]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userGroups.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "groupCell", for: indexPath)
        guard let groupCell = cell as? GroupTableCell else { return cell }
        
        let groupData = userGroups[indexPath.row]
        groupCell.name?.text = groupData.name
        groupCell.picture?.image = groupData.image
        groupCell.selectionStyle = .none
        
        return groupCell
    }
    
    @IBAction func didSelectGroup(segue: UIStoryboardSegue) {
        guard let findGroupsVC = segue.source as? FindGroupsController else { return }
        guard let selected = findGroupsVC.tableView.indexPathForSelectedRow else { return }
        
        let group = findGroupsVC.groups[selected.row]
        
        if !userGroups.contains(group) {
            userGroups.append(group)
            tableView.reloadData()
        }
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            userGroups.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let findGroupsVC = segue.destination as? FindGroupsController else { return }
        findGroupsVC.groups = findGroupsVC.groups.filter { !userGroups.contains($0) }
    }
}
