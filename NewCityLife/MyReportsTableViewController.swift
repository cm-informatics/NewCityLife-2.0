//
//  MyReportsTableViewController.swift
//  NewCityLife
//
//  Created by Christian Mansch on 13.04.19.
//  Copyright © 2019 Christian.Mansch. All rights reserved.
//

import UIKit

class MyReportsTableViewController: UITableViewController {

    var reportsData = (keys: [Any](), payload: [Report]())
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        reportsData = PListService.loadReports()
        print("Count: \(reportsData.payload.count)")
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reportsData.payload.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myReportsCell", for: indexPath) as! MyReportsTableViewCell
        
        //let report = reportsArray[indexPath.row]
        //let report = reportsData.payload.object(forKey: reportsData.keys[indexPath.row]) as! NSDictionary
        let report = reportsData.payload[indexPath.row]
        
        
        cell.labelCategory.text = report.category
        cell.labelLocation.text = report.comment
        /*cell.labelCategory.text = report.object(forKey: "category") as? String
        cell.labelDate.text = "\(report.object(forKey: "date") ?? "keine Daten")"
        cell.labelLocation.text = "\(report.object(forKey: "latitude") ?? "keine Daten")"
        
        cell.reportImage.image = UIImage(data: report.object(forKey: "image") as! Data)
 */
        return cell
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
        return 100
    }
 
}
