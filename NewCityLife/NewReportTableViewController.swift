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
    
    // MARK: - LocationObserver
    func locationChanged(latitude: Double, longitude: Double) {
        print("Latitude is: \(latitude)")
        print("Longitude is: \(longitude)")
        tableView.reloadData()
    }
    
    func locationUpdateDidFail(error: Error) {
        print("Error")
    }
    
     // MARK: - Navigation
    
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "catSegue" {
            let navigationController = segue.destination as! UINavigationController
            let categoryTableView = navigationController.children[0] as! CategoryTableViewController
            categoryTableView.onSave = onSave
        }
        
        if segue.identifier == "commentSegue" {
            //let navigationController = segue.destination as! UINavigationController
            let commentViewController = segue.destination as! CommentViewController
            commentViewController.onSaveComment = onSaveComment
            commentViewController.savedText = tableViewService.contentData[2]
        }
    print("Testtttttttttttt")
     }
    
    func onSave(_ data: String) -> () {
        tableViewService.contentData[1] = data
        tableView.reloadSections(IndexSet(arrayLiteral: 1), with: .automatic)
    }
    
    func onSaveComment(_ data: String) -> () {
        tableViewService.contentData[2] = data
        tableView.reloadSections(IndexSet(arrayLiteral: 2), with: .automatic)
    }
    @IBAction func goToCamera(_ sender: Any) {
        /*let cameraService = CameraService()
        cameraService.prepareCamera()
 */
    }
}
