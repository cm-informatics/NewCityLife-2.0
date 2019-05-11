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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "newReportCell", for: indexPath)
        //cell.textLabel?.text = headerArray[indexPath.section]
        
        switch indexPath.section {
        case 0:
            cell.textLabel?.text = contentData[indexPath.section]
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
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return headerArray[section]
        case 1:
            return headerArray[section]
        case 2:
            return headerArray[section]
        case 3:
            return headerArray[section]
        case 4:
            return headerArray[section]
        default:
            return ""
        }
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
