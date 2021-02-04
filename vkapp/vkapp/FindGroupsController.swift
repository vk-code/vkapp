//
//  FindGroupsController.swift
//  vkapp
//
//  Created by Vasiliy Kapyshkov on 25.01.2021.
//

import UIKit

class FindGroupsController: UITableViewController {

    @IBOutlet var searchBar: UISearchBar?
    
    var groupsArr: [Group] = [
        Group(name: "Актёрское мастерство", image: "acting"),
        Group(name: "Уроки игры на гитаре", image: "guitar"),
        Group(name: "Мода", image: "fashion"),
        Group(name: "Палеонтология", image: "paleontology"),
        Group(name: "Мужская кухня", image: "cooking"),
        Group(name: "Реклама и маркетинг", image: "marketing"),
    ]
    var groups: [Group] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        groups = groupsArr
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "groupCell", for: indexPath)
        guard let groupCell = cell as? GroupTableCell else { return cell }
        
        let groupData = groups[indexPath.row]
        groupCell.name?.text = groupData.name
        groupCell.picture?.image = groupData.image
        
        return groupCell
    }
}


extension FindGroupsController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        groups = searchText.isEmpty ? groupsArr : groupsArr.filter({ element in
            return element.name.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
        })
        tableView.reloadData()
    }
}
