//
//  NewReportTableViewController.swift
//  NewCityLife
//
//  Created by Christian Mansch on 13.04.19.
//  Copyright © 2019 Christian.Mansch. All rights reserved.
//

import UIKit
import CoreLocation

class NewReportTableViewController: UITableViewController{

    let locationManager = CLLocationManager()
    let locationService = LocationService()
    
    let tableViewService = TableViewService()
    let headerTitle = ["Bild", " Kategorie", "Kommentar", "Standort", "Datum"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewService.headerArray = headerTitle
        
        tableView.delegate = tableViewService
        tableView.dataSource = tableViewService

        
        locationManager.delegate = locationService
        //locationManager.delegate = self
        
        //LocationService().getCurrentLocation()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.requestWhenInUseAuthorization()
            locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
            locationManager.startUpdatingLocation()
            print("Go...")
            
        }
        else {
            print("Not allowed")
        }
        
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
        
        /*
        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            manager.stopUpdatingLocation()
            
            print("Location is: \(locations[0].coordinate.latitude)")
            print("Location is: \(locations[0].coordinate.longitude)")
        }
        
        func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
            print("\(#function)")
            manager.stopUpdatingLocation()
            print(error)
        }
 */

    }
}
