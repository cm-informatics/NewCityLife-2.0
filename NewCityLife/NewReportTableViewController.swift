//
//  NewReportTableViewController.swift
//  NewCityLife
//
//  Created by Christian Mansch on 13.04.19.
//  Copyright © 2019 Christian.Mansch. All rights reserved.
//

import UIKit
import CoreLocation

class NewReportTableViewController: UITableViewController, CLLocationManagerDelegate{

    let locationManager = LocationService()
    let tableViewService = TableViewService()
    let headerTitle = ["Bild", " Kategorie", "Kommentar", "Standort", "Datum"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewService.headerArray = headerTitle
        
        tableView.delegate = tableViewService
        tableView.dataSource = tableViewService

        //LocationService().getCurrentLocation()
        
        /*locationManager.delegate = self
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.requestWhenInUseAuthorization()
            locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
            locationManager.startUpdatingLocation()
            print("Go...")
            
        }
        else {
            print("Not allowed")
        }
 */
        
    }

    // MARK: - Table view data source

   /* override func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newReportCell", for: indexPath)

        switch indexPath.section {
        case 0:
            cell.textLabel?.text = "Bild"
        case 1:
            cell.textLabel?.text = "Kategorie"
        case 2:
            cell.textLabel?.text = "Kommentar"
        case 3:
            cell.textLabel?.text = "Standort"
        case 4:
            cell.textLabel?.text = getDate()
        default:
            cell.textLabel?.text = ""
        }

        return cell
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
    
    func getDate() -> String {
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone.current
        formatter.locale = Locale(identifier: "de_DE")
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        formatter.dateFormat = "dd.MMMM yyyy, HH:mm"
        
        
        return formatter.string(from: Date())
    }

}
