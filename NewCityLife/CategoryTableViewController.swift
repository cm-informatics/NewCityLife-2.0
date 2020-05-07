//
//  CategoryTableViewController.swift
//  NewCityLife
//
//  Created by Christian Mansch on 01.06.19.
//  Copyright © 2019 Christian.Mansch. All rights reserved.
//

import UIKit

class CategoryTableViewController: UITableViewController {

    var issueArray = ["Graffiti", "Schlagloch", "Müll", "Brandschaden", "Wasserschaden"]
    var onSave: ((_ data: String) -> ())?
    
    
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Item \(indexPath.row) selected")
        onSave?(issueArray[indexPath.row])
        dismiss(animated: true, completion: nil)
    }

    @IBAction func cancelButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
