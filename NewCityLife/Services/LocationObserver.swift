//
//  LocationObserver.swift
//  NewCityLife
//
//  Created by Christian Mansch on 04.05.19.
//  Copyright © 2019 Christian.Mansch. All rights reserved.
//

import Foundation
import CoreLocation

protocol LocationObserver {
    func locationChanged(location: CLLocationCoordinate2D)
    func locationUpdateDidFail(error: Error)
}
