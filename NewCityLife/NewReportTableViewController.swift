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
    
    func getImageFromImagePickerController(_ image: UIImage) -> () {
        print("I HAVE MY IMAGE: \(image)")
        tableViewService.reportDictionary["Image"] = image
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
            }
        }
    }
    
//    func dismissImagePickerController(_ image: UIImage?) {
//        if let selectedImage = image {
//            print("SELECTED Image: \(selectedImage)")
//            reportDictionary["Image"] = selectedImage
//        }
//        dismissCameraPickerController?()
//    }
}
