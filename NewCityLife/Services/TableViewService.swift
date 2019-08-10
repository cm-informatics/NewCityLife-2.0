//
//  TableViewService.swift
//  NewCityLife
//
//  Created by Christian Mansch on 03.05.19.
//  Copyright © 2019 Christian.Mansch. All rights reserved.
//

import UIKit

class TableViewService: NSObject, UITableViewDelegate, UITableViewDataSource, LocationObserver {
    
    let headerArray = ["Foto", " Kategorie", "Kommentar", "Standort", "Datum"]
    var contentData = ["Ausgewähltes Foto", "Bitte wählen...", "Kommentar schreiben...", "", ""]
    
    var reportDictionary: [String:Any?] = ["Location": nil, "Image": UIImage(named: "no_image"), "Kategorie": nil, "Kommentar": nil, "Date": nil]
    
    let cameraService = CameraService()
    
    var presentImagePickerController: ((_ viewController: UIImagePickerController) -> ())?
    var dismissCameraPickerController: (() -> ())?
    var getImageFromImagePickerController: ((_ image: UIImage) -> ())?
    
    var onLocationChanged: ((_ location: (latitude: Double, longitude: Double)) -> ())?
    
    
    //MARK: - TableView DataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //let cell = tableView.dequeueReusableCell(withIdentifier: "newReportCell")
        
        switch indexPath.section {
        case 0:
            let customCell = tableView.dequeueReusableCell(withIdentifier: "imageCell", for: indexPath) as! ImageTableViewCell
            customCell.imageCellLabel.text = contentData[indexPath.section]
            customCell.imageCellImageView.image = reportDictionary["Image"] as? UIImage
            //customCell.imageCellLabel.text = "zzz"
            return customCell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath)
            cell.textLabel?.text = contentData[indexPath.section]
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "commentCell", for: indexPath)
            cell.textLabel?.text = contentData[indexPath.section]
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "locationCell", for: indexPath)
            cell.textLabel?.text = contentData[indexPath.section]
            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: "dateCell", for: indexPath)
            cell.textLabel?.text = getDate()
            return cell
 
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath)
            cell.textLabel?.text = contentData[indexPath.section]
            return cell

        }
    }
    
    //MARK: - TableView Delegate
    
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return headerArray[section]
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 110
        }
        return tableView.rowHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath)")
        if indexPath.section == 0 {
            let  imagePicker = UIImagePickerController()
            imagePicker.delegate = cameraService
            
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                imagePicker.sourceType = .camera
            }
            else {
                imagePicker.sourceType = .photoLibrary
            }
            presentImagePickerController?(imagePicker)
            cameraService.dismissImagePickerController = dismissImagePickerController
        }
    }
    
    //MARK: - LocationObserver
    
    func locationChanged(location: (latitude: Double, longitude: Double)) {
        onLocationChanged?((latitude: location.latitude, longitude: location.longitude))
    }
    
    func locationUpdateDidFail(error: Error) {
        print("TBL error: \(error.localizedDescription)")
    }
    
    //MARK: - Internal func
    
    private func getDate() -> String {
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone.current
        formatter.locale = Locale(identifier: "de_DE")
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        formatter.dateFormat = "d. MMMM yyyy, HH:mm"
        
        return formatter.string(from: Date())
    }
    
    func notifyViewControllers() {
    }
    
    func dismissImagePickerController(_ image: UIImage?) {
        if let selectedImage = image {
            print("SELECTED Image: \(selectedImage)")
            getImageFromImagePickerController?(selectedImage)
        }
        
        dismissCameraPickerController?()
    }
    
}
