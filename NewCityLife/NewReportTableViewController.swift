//
//  NewReportTableViewController.swift
//  NewCityLife
//
//  Created by Christian Mansch on 13.04.19.
//  Copyright © 2019 Christian.Mansch. All rights reserved.
//

import UIKit

class NewReportTableViewController: UITableViewController{
    
    let tableViewService = TableViewService()
    let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = tableViewService
        tableView.dataSource = tableViewService
        
        appDelegate.locationDidChanged = locationDidChanged
        
        tableViewService.presentImagePickerController = presentImagePickerController
        tableViewService.dismissCameraPickerController = dismissCameraPickerController
        tableViewService.getImageFromImagePickerController = getImageFromImagePickerController
       
    }
    
    func locationDidChanged(location: (latitude: Double, longitude: Double)) {
        tableViewService.contentData[3] = "\(location.latitude), \(location.longitude)"
        tableViewService.reportDictionary[.location] = location
        
        tableView.reloadData()
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
    
    
    func onSave(_ data: String) -> () {
        tableViewService.contentData[1] = data
        tableViewService.reportDictionary[.category] = data
        tableView.reloadSections(IndexSet(arrayLiteral: 1), with: .automatic)
    }
    
    func onSaveComment(_ data: String) -> () {
        tableViewService.contentData[2] = data
        tableViewService.reportDictionary[.comment] = data
        tableView.reloadSections(IndexSet(arrayLiteral: 2), with: .automatic)
    }
    
    func presentImagePickerController(_ viewController: UIImagePickerController) -> (){
        self.present(viewController, animated: true, completion: nil)
    }
    
    func dismissCameraPickerController() -> () {
        dismiss(animated: true, completion: nil)
    }
    
    func getImageFromImagePickerController(_ image: UIImage) -> () {
        print("I HAVE MY IMAGE: \(image)")
        tableViewService.reportDictionary[.image] = image
        tableView.reloadData()
    }
    
    @IBAction func sendButtonPressed(_ sender: UIBarButtonItem) {
        let values = tableViewService.reportDictionary.values
        print(values)
        for value in values {
            if value == nil {
                let alertView = UIAlertController(title: "Fehler", message: "Alle Werte angeben", preferredStyle: .alert)
                alertView.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alertView, animated: true, completion: nil)
                return
            }
        }
        print("Ende")
        
        //createDictionary()
        
        
        
        PListService.saveReportToPlist(dictionary: createDictionary())
        
        //PListService.loadReports()

    }
    
    private func createDictionary() -> Dictionary<TableViewService.Components, Any?>{
        
        
        let location = tableViewService.reportDictionary[.location] as! (latitude: Double, longitude: Double)
        
        
        let report = Report()
        
        tableViewService.reportDictionary[.id] = report.id
        
        report.category = tableViewService.reportDictionary[.category] as? String
        report.comment = tableViewService.reportDictionary[.comment] as? String
        report.image = tableViewService.reportDictionary[.image] as? UIImage
        
        report.locationData.latitude = location.latitude
        report.locationData.longitude = location.longitude
        report.timestamp = tableViewService.reportDictionary[.date] as? Date
        
        print("my ID is: \(String(describing: tableViewService.reportDictionary[.id]))")
        
        
        
        //defaults.set(report.locationData.latitude, forKey: "loc")
        //defaults.set(report.timestamp, forKey: "date")
        //print(defaults.object(forKey: "date"))
        //print(defaults.object(forKey: "loc"))
        
        return tableViewService.reportDictionary
        
    }
    
    func persistData(report: Report) {
        let defaults = UserDefaults.standard
        
        defaults.set(report.category, forKey: "category")
        defaults.set(report.comment, forKey: "comment")
        defaults.set(report.image, forKey: "image")
        defaults.set(report.timestamp, forKey: "date")
        defaults.set(report.locationData.latitude, forKey: "latitude")
        defaults.set(report.locationData.longitude, forKey: "longitude")
    }
}
