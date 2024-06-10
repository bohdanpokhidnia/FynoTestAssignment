//
//  Country.swift
//  FynoTestAssignment
//
//  Created by Bohdan Pokhidnia on 09.06.2024.
//

import SwiftUI
import MapKit

struct Country: Identifiable, Equatable {
    let id = UUID()
    let name: String
    let emoji: CountryEmoji
    let coordinate: CLLocationCoordinate2D
    let isVisited: Bool
    
    static func == (lhs: Country, rhs: Country) -> Bool {
        lhs.id == rhs.id
    }
}
