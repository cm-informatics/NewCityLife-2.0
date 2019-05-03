//
//  TableViewService.swift
//  NewCityLife
//
//  Created by Christian Mansch on 03.05.19.
//  Copyright © 2019 Christian.Mansch. All rights reserved.
//

import UIKit

class TableViewService: UITableView, UITableViewDelegate, UITableViewDataSource {
    
    var headerArray = [String]()
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "newReportCell", for: indexPath)
        cell.textLabel?.text = headerArray[indexPath.section]
        
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
}
