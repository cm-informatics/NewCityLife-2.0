//
//  TableViewService.swift
//  NewCityLife
//
//  Created by Christian Mansch on 03.05.19.
//  Copyright © 2019 Christian.Mansch. All rights reserved.
//

import UIKit

class TableViewService: UITableView, UITableViewDelegate, UITableViewDataSource, LocationObserver {
    var headerArray = [String]()
    var contentData = ["", "", "", "", ""]
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //let cell = tableView.dequeueReusableCell(withIdentifier: "newReportCell", for: indexPath)
        //var cell = UITableViewCell()
        
        if indexPath.section == 0 {
            let cell = Bundle.main.loadNibNamed("ImageTableViewCell", owner: nil, options: nil)?.first as! ImageTableViewCell
            cell.imageCellLabel.text = "Hello World"
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "newReportCell", for: indexPath)
            cell.textLabel?.text = "test"
            
            return cell
        }
        
        /*switch indexPath.section {
        case 0:
            cell = Bundle.main.loadNibNamed("ImageTableViewCell", owner: nil, options: nil)?.first as! ImageTableViewCell
            //let cell = dequeueReusableCell(withIdentifier: "imageCell", for: indexPath) as! ImageTableViewCell
            print("Custom")
            cell.imageCellImageView.image = UIImage(named: "outline_file_copy_black_18dp")
            cell.imageCellLabel.text = "Hello World!"

            return cell
        case 1:
            cell.textLabel?.text = contentData[indexPath.section]
        case 2:
            cell.textLabel?.text = contentData[indexPath.section]
        case 3:
            cell.textLabel?.text = contentData[indexPath.section]
        case 4:
            cell.textLabel?.text = getDate()
        default:
            cell.textLabel?.text = ""

        }*/
        
        //return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return headerArray[section]
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 110
        }
        return self.rowHeight
    }
    
    //MARK: - LocationObserver
    
    func locationUpdateDidFail(error: Error) {
        print("TBL error: \(error.localizedDescription)")
    }
    
    func locationChanged(latitude: Double, longitude: Double) {
        print("TBL Latitude is: \(latitude)")
        print("TBL Longitude is: \(longitude)")
        
        contentData[3] = "\(latitude), \(longitude)"
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
}
