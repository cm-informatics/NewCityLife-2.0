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
    
    var observerList = [LocationObserver]()
    
    var error: Error?
    
    func getCurrentLocation(locationManager: CLLocationManager) {
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.requestWhenInUseAuthorization()
            locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
            locationManager.startUpdatingLocation()
        }
        else {
            print("Not allowed")
        }
    }
    
    func register(observer: LocationObserver) {
        observerList.append(observer)
    }
    
    func unregister(observer: LocationObserver) {
        //TODO: Observer abmelden
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        manager.stopUpdatingLocation()
        
        var location = (latitude: Double(), longitude: Double())
        location.latitude = locations[0].coordinate.latitude
        location.longitude = locations[0].coordinate.longitude
        notifyObservers(location: location)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error: \(error.localizedDescription)")
        self.error = error
        manager.stopUpdatingLocation()
        notifyObservers(location: nil)
    }
    
    func notifyObservers(location: (latitude: Double, longitude: Double)?) {
        
        if let position = location {
            for item in observerList {
                item.locationChanged(location: position)
            }
        }
        else {
            for item in observerList {
                item.locationUpdateDidFail(error: error!)
            }
        }
    }
}
