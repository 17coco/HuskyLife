//
//  MapViewController.swift
//  HuskyLife
//
//  Created by Tonycai on 12/2/24.
//

import UIKit
import MapKit


class MapViewController: UIViewController {
    
    let mapView = MapView()
    let locationManager = CLLocationManager()
    
    var dataTitle = "Northeastern University"
    var coordinate = CLLocationCoordinate2D(latitude: 42.339918, longitude: -71.089797)
    var info = "LVX VERITAS VIRTVS"
    
    override func loadView() {
        view = mapView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Search in Map"
        navigationController?.navigationBar.prefersLargeTitles = true
        // Do any additional setup after loading the view.
        mapView.buttonCurrentLocation.addTarget(self, action: #selector(onButtonCurrentLocationTapped), for: .touchUpInside)
        setupLocationManager()
        
        // Search function
        mapView.buttonSearch.addTarget(self, action: #selector(onButtonSearchTapped), for: .touchUpInside)
        // center the map view to current location
        onButtonCurrentLocationTapped()
        
        NotificationCenter.default.addObserver(self, selector: #selector(handlePlaceSelection(_:)), name: .placeSelected, object: nil)
        
        let mapData = Place(
            title: dataTitle,
            coordinate: coordinate,
            info: info
        )
        mapView.mapView.addAnnotation(mapData)
        mapView.mapView.centerToLocation(location: CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude))
        
        mapView.mapView.delegate = self
        
    }
    
    @objc func onButtonCurrentLocationTapped(){
        guard let currentLocation = locationManager.location else {
            print("Location is unavailable")
            return
        }
        mapView.mapView.centerToLocation(location: currentLocation)
    }
    
    @objc func onButtonSearchTapped(){
        
        //MARK: Setting up bottom search sheet...
        let searchViewController  = SearchViewController()
        searchViewController.delegateToMapView = self
        let navForSearch = UINavigationController(rootViewController: searchViewController)
        navForSearch.modalPresentationStyle = .pageSheet
        
        if let searchBottomSheet = navForSearch.sheetPresentationController{
            searchBottomSheet.detents = [.medium(), .large()]
            searchBottomSheet.prefersGrabberVisible = true
        }
        
        present(navForSearch, animated: true)
    }
    
    func showSelectedPlace(placeItem: MKMapItem){
        print("Show selected Place")
        let coordinate = placeItem.placemark.coordinate
        mapView.mapView.centerToLocation(
            location: CLLocation(
                latitude: coordinate.latitude,
                longitude: coordinate.longitude
            )
        )
        let place = Place(
            title: placeItem.name!,
            coordinate: coordinate,
            info: placeItem.description
        )
        mapView.mapView.addAnnotation(place)
    }
    
    @objc func handlePlaceSelection(_ notification: Notification) {
        guard let mapData = notification.object as? Place else {
            print("Invalid place item received")
            return
        }
        mapView.mapView.addAnnotation(mapData)
        mapView.mapView.centerToLocation(location: CLLocation(latitude: mapData.coordinate.latitude, longitude: mapData.coordinate.longitude))
    }
}

extension MKMapView{
    func centerToLocation(location: CLLocation, radius: CLLocationDistance = 1000){
        let coordinateRegion = MKCoordinateRegion(
            center: location.coordinate,
            latitudinalMeters: radius,
            longitudinalMeters: radius
        )
        setRegion(coordinateRegion, animated: true)
    }
}

