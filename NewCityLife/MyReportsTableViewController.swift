//
//  MyReportsTableViewController.swift
//  NewCityLife
//
//  Created by Christian Mansch on 13.04.19.
//  Copyright © 2019 Christian.Mansch. All rights reserved.
//

import UIKit

class MyReportsTableViewController: UITableViewController {

    //var myReportsDictionary = NSDictionary()
    //var myReportsArray = [[String: Any]]()
    var reportsArray = [Report]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        reportsArray = PListService.loadReports()
        //print("Reps: \(myReportsArray)")
        print("Count: \(reportsArray.count)")
        
        //# TODO: Read the contents of the data stored in reportsArray and display them into the table view
        //var reportsArray = prepareTableData(dataDict: myReportsDictionary)
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reportsArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myReportsCell", for: indexPath) as! MyReportsTableViewCell

        //let report = myReportsDictionary.allValues[indexPath.row]
        //let report = myReportsDictionary.allKeys[indexPath.row]
        
        let report = reportsArray[indexPath.row]
        
        cell.labelCategory.text = report.category
        //cell.labelCategory.text = report["category"] as? String
        
        //print(report["category"] ?? "nil")
        //cell.labelCategory.text = report["category"] as? String
        //cell.labelCategory.text = report["category"] as? String
        //cell.textLabel?.text = report["category"] as? String
        return cell
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        reportsArray = PListService.loadReports()
        tableView.reloadData()
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
    
    //MARK: UITableViev Delegate
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}
