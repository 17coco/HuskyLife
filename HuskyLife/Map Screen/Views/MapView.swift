//
//  MapView.swift
//  HuskyLife
//
//  Created by Tonycai on 12/2/24.
//

import UIKit
import MapKit

class MapView: UIView {
    var mapView:MKMapView!
    var buttonLoading:UIButton!
    var buttonCurrentLocation:UIButton!
    var buttonSearch:UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupMapView()
        setupButtonLoading()
        setupButtonCurrentLocation()
        setupButtonSearch()
        initConstraints()
    }
    
    func setupMapView(){
        mapView = MKMapView()
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.layer.cornerRadius = 10
        self.addSubview(mapView)
    }
    
    func setupButtonLoading(){
        buttonLoading = UIButton(type: .system)
        buttonLoading.setTitle(" Fetching Location...  ", for: .normal)
        buttonLoading.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        buttonLoading.setImage(UIImage(systemName: "circle.dotted"), for: .normal)
        buttonLoading.layer.backgroundColor = UIColor.black.cgColor
        buttonLoading.tintColor = .white
        buttonLoading.layer.cornerRadius = 10
        
        buttonLoading.layer.shadowOffset = .zero
        buttonLoading.layer.shadowRadius = 4
        buttonLoading.layer.shadowOpacity = 0.7
        
        buttonLoading.translatesAutoresizingMaskIntoConstraints = false
        
        buttonLoading.isEnabled = false
        self.addSubview(buttonLoading)
    }
    
    func setupButtonCurrentLocation(){
        buttonCurrentLocation = UIButton(type: .system)
        buttonCurrentLocation.setImage(UIImage(systemName: "location.circle"), for: .normal)
        buttonCurrentLocation.layer.backgroundColor = UIColor.lightGray.cgColor
        buttonCurrentLocation.tintColor = .blue
        buttonCurrentLocation.layer.cornerRadius = 10
        
        buttonCurrentLocation.layer.shadowOffset = .zero
        buttonCurrentLocation.layer.shadowRadius = 4
        buttonCurrentLocation.layer.shadowOpacity = 0.7
        
        buttonCurrentLocation.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(buttonCurrentLocation)
    }
    
    func setupButtonSearch(){
        buttonSearch = UIButton(type: .system)
        buttonSearch.setTitle(" Search places...  ", for: .normal)
        buttonSearch.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        buttonSearch.setImage(UIImage(systemName: "magnifyingglass.circle.fill"), for: .normal)
        buttonSearch.layer.backgroundColor = UIColor.darkGray.cgColor
        buttonSearch.tintColor = .white
        buttonSearch.layer.cornerRadius = 10
        
        buttonSearch.layer.shadowOffset = .zero
        buttonSearch.layer.shadowRadius = 4
        buttonSearch.layer.shadowOpacity = 0.7
        buttonSearch.contentEdgeInsets = UIEdgeInsets(top: 6, left: 8, bottom: 6, right: 8)
        buttonSearch.translatesAutoresizingMaskIntoConstraints = false
        buttonSearch.isHidden = false
        self.addSubview(buttonSearch)
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            mapView.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            mapView.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor),
            mapView.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor, multiplier: 0.95),
            mapView.heightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.heightAnchor, multiplier: 0.95),
            
            buttonLoading.centerXAnchor.constraint(equalTo: mapView.centerXAnchor),
            buttonLoading.centerYAnchor.constraint(equalTo: mapView.centerYAnchor),
            buttonLoading.widthAnchor.constraint(equalToConstant: 240),
            buttonLoading.heightAnchor.constraint(equalToConstant: 40),
            
            buttonCurrentLocation.trailingAnchor.constraint(equalTo: mapView.trailingAnchor, constant: -16),
            buttonCurrentLocation.bottomAnchor.constraint(equalTo: self.mapView.bottomAnchor, constant: -8),
            buttonCurrentLocation.heightAnchor.constraint(equalToConstant: 36),
            buttonCurrentLocation.widthAnchor.constraint(equalToConstant: 36),
            
            buttonSearch.bottomAnchor.constraint(equalTo: buttonCurrentLocation.bottomAnchor),
            buttonSearch.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            buttonSearch.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
