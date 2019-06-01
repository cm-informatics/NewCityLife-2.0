//
//  CategoryTableViewController.swift
//  NewCityLife
//
//  Created by Christian Mansch on 01.06.19.
//  Copyright © 2019 Christian.Mansch. All rights reserved.
//

import UIKit

class CategoryTableViewController: UITableViewController {

    var issueArray = ["Grafiti", "Schlagloch", "Müll", "Brandschaden", "Wasserschaden"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return issueArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel?.text = issueArray[indexPath.row]
        return cell
    }

    @IBAction func cancelButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
