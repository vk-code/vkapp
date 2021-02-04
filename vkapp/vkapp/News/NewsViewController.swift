//
//  NewsViewController.swift
//  vkapp
//
//  Created by Vasiliy Kapyshkov on 04.02.2021.
//

import UIKit

class NewsViewController: UITableViewController {

    private let newsData = [
        News(headline: "Friends Stars Disliked Working With Jean-Claude Van Damme", date: "04.02.2021", text: "Jennifer Aniston and Courteney Cox reportedly had a difficult time working with Jean-Claude Van Damme during the second season of Friends.", imageName: "Rachel"),
        News(headline: "Matt LeBlance Stole the Magna Doodle to Gift It to a Special Coworker", date: "03.02.2021", text: "TV shows are brought to life through the hard work of many different creative teams. The makeup crew is able to transform characters into their fictional selves. Set design is able to transform the backdrops into the specific atmosphere needed to bring the show to life. \r\rOf course, the actors, directors, and writers bring the story to life as it unfolds on the screen. One element that’s sometimes overlooked is prop selection. These little details help make the show seem real and sometimes the props become an iconic part of an important scene. ", imageName: "Joey")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return newsData.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath)
        guard let newsCell = cell as? NewsTableCell else { return cell }
        
        let singleNewsItem = newsData[indexPath.row]
        
        newsCell.newsHeadlineLabel?.text = singleNewsItem.headline
        newsCell.dateHeadlineLabel?.text = singleNewsItem.date
        newsCell.newsTextLabel?.text = singleNewsItem.text
        newsCell.newsPhotoView?.image = singleNewsItem.photo
        newsCell.selectionStyle = .none
        
        return newsCell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
