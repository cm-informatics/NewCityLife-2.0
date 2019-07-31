//
//  NewReportTableViewController.swift
//  NewCityLife
//
//  Created by Christian Mansch on 13.04.19.
//  Copyright © 2019 Christian.Mansch. All rights reserved.
//

import CoreLocation
import UIKit

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
        
        locationService.register(observer: tableViewService)
        //locationService.register(observer: self)
        
        tableViewService.onLocationChanged = onLocationChanged
        
        tableViewService.presentImagePickerController = presentImagePickerController
        tableViewService.dismissCameraPickerController = dismissCameraPickerController
    }
    
    func locationChanged(location: (latitude: Double, longitude: Double)) {
        print("Latitude now: \(location.latitude)")
        print("Longitude now: \(location.longitude)")
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
     }
    
    //MARK: - Callbacks
    /*func onLocationChanged(_ location: CLLocationCoordinate2D) {
        print("Latitude is: \(location.latitude)")
        print("Longitude is: \(location.longitude)")
        tableView.reloadData()
    }
 */
    
    func onLocationChanged(_ location: (latitude: Double, longitude: Double)) {
        print("Latitude is: \(location.latitude)")
        print("Longitude is: \(location.longitude)")
        tableView.reloadData()
        //Vielleicht mit Notifaction Center lösen
    }
    
    func onSave(_ data: String) -> () {
        tableViewService.contentData[1] = data
        tableView.reloadSections(IndexSet(arrayLiteral: 1), with: .automatic)
    }
    
    func onSaveComment(_ data: String) -> () {
        tableViewService.contentData[2] = data
        tableView.reloadSections(IndexSet(arrayLiteral: 2), with: .automatic)
    }
    
    func presentImagePickerController(_ viewController: UIImagePickerController) -> (){
        self.present(viewController, animated: true, completion: nil)
    }
    
    func dismissCameraPickerController() -> () {
        dismiss(animated: true, completion: nil)
    }
    
}
