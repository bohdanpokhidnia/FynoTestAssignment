//
//  Country.swift
//  FynoTestAssignment
//
//  Created by Bohdan Pokhidnia on 09.06.2024.
//

import SwiftUI
import MapKit

struct Country: Identifiable, Equatable, Decodable {
    struct Coordinate: Decodable {
        let latitude: Double
        let longitude: Double
    }
    
    let id = UUID()
    let name: String
    let emoji: CountryEmoji
    let coordinate: Coordinate
    let isVisited: Bool
    
    enum CodingKeys: CodingKey {
        case name
        case emoji
        case coordinate
        case isVisited
    }
    
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: coordinate.latitude, longitude: coordinate.longitude)
    }
    
    static func == (lhs: Country, rhs: Country) -> Bool {
        lhs.id == rhs.id
    }
}

extension Country {
    static let mockData: [Country] = [
        Country(
            name: "Ukraine",
            emoji: .ukraine,
            coordinate: Coordinate(latitude: 0, longitude: 0),
            isVisited: false
        ),
        Country(
            name: "Mexico",
            emoji: .mexico,
            coordinate: Coordinate(latitude: 0, longitude: 0),
            isVisited: false
        ),
        Country(
            name: "Chile",
            emoji: .chile,
            coordinate: Coordinate(latitude: 0, longitude: 0),
            isVisited: false
        ),
        Country(
            name: "Iceland",
            emoji: .iceland,
            coordinate: Coordinate(latitude: 0, longitude: 0),
            isVisited: false
        ),
        Country(
            name: "Dominican Republic",
            emoji: .dominicanRepublic,
            coordinate: Coordinate(latitude: 0, longitude: 0),
            isVisited: false
        ),
    ]
}
