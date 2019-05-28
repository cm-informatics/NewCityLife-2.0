//
//  NewReportTableViewController.swift
//  NewCityLife
//
//  Created by Christian Mansch on 13.04.19.
//  Copyright © 2019 Christian.Mansch. All rights reserved.
//

import UIKit
import CoreLocation

class NewReportTableViewController: UITableViewController, LocationObserver{
    
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
        
        locationService.getCurrentLocation(locationManager: locationManager)
        locationService.register(observer: self)
        
        //Hier melde ich zusätzlich den TableViewService an, ist vielleicht besser als self
        locationService.register(observer: tableViewService)
        
        //Register Custom Cell
        let nib = UINib(nibName: "ImageTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "imageCell")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
    
    // MARK: - LocationObserver
    func locationChanged(latitude: Double, longitude: Double) {
        /*print("Latitude is: \(latitude)")
        print("Longitude is: \(longitude)")
 */
    }
    
    func locationUpdateDidFail(error: Error) {
        print("Error")
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
}
