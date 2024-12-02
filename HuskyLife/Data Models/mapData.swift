//
//  mapData.swift
//  HuskyLife
//
//  Created by Tonycai on 12/1/24.
//

import Foundation
import FirebaseFirestore
import CoreLocation

struct MapData: Codable {
    let address: String
    let category: String
    let description: String
    let location: GeoPoint
    let name: String
    
    // Convert Firestore GeoPoint to CLLocationCoordinate2D
    var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
    }
}
