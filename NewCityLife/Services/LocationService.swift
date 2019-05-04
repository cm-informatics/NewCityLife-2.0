//
//  LocationService.swift
//  NewCityLife
//
//  Created by Christian Mansch on 19.04.19.
//  Copyright © 2019 Christian.Mansch. All rights reserved.
//

import Foundation
import CoreLocation

class LocationService: NSObject, CLLocationManagerDelegate {
    
    func getCurrentLocation(locationManager: CLLocationManager) {
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.requestWhenInUseAuthorization()
            locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
            locationManager.startUpdatingLocation()
            print("Los...")
            
        }
        else {
            print("Not allowed")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        manager.stopUpdatingLocation()
        
        print("Location is: \(locations[0].coordinate.latitude)")
        print("Location is: \(locations[0].coordinate.longitude)")
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("\(#function)")
        manager.stopUpdatingLocation()
        print(error)
    }
}
