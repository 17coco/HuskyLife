//
//  LocationManager.swift
//  HuskyLife
//
//  Created by Tonycai on 12/2/24.
//

import Foundation
import CoreLocation

//MARK: setting up location manager delegate...
extension MapViewController: CLLocationManagerDelegate{
    func setupLocationManager(){
        //MARK: setting up location manager to get the current location...
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        mapView.buttonLoading.isHidden = false
        locationManager.startUpdatingLocation()
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        //MARK: if the user either allows location while using the app or always...
        if manager.authorizationStatus == .authorizedWhenInUse
            || manager.authorizationStatus == .authorizedAlways{
            mapView.buttonLoading.isHidden = false
            manager.requestLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first{
            mapView.buttonLoading.isHidden = true
            manager.stopUpdatingLocation()
        }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        mapView.buttonLoading.isHidden = true
        print("location error: \(error.localizedDescription)")
    }
}
