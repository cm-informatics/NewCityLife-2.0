//
//  Report.swift
//  NewCityLife
//
//  Created by Christian Mansch on 19.04.19.
//  Copyright © 2019 Christian.Mansch. All rights reserved.
//

import UIKit
import CoreLocation

class Report {
    var id: String!
    var image: UIImage!
    var category: String!
    var locationData: CLLocationCoordinate2D!
    var comment: String!
    var timestamp: Date!
    
//    init(image: UIImage, category: String, locationData: CLLocationCoordinate2D, comment: String, timestamp: Date) {
//        id = UUID().uuidString
//        self.image = image
//        self.category = category
//        self.comment = comment
//        self.timestamp = timestamp
//        self.locationData = locationData
//    }
    
    init() {
        id = UUID().uuidString
    }
}
