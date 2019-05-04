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
        
        let latitude = locations[0].coordinate.latitude
        let longitude = locations[0].coordinate.longitude
        
        notifyObservers(latitude: latitude, longitude: longitude)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("\(#function)")
        manager.stopUpdatingLocation()
        print(error)
    }
    
    func notifyObservers(latitude: Double, longitude: Double) {
        for item in observerList {
            item.locationChanged(latitude: latitude, longitude: longitude)
        }
    }
}
