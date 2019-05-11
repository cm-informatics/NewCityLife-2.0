//
//  LocationObserver.swift
//  NewCityLife
//
//  Created by Christian Mansch on 04.05.19.
//  Copyright © 2019 Christian.Mansch. All rights reserved.
//

import Foundation

protocol LocationObserver {
    func locationChanged(latitude: Double, longitude: Double)
    func locationUpdateDidFail(error: Error)
}
