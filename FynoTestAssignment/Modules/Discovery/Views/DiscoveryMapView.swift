//
//  DiscoveryMapView.swift
//  FynoTestAssignment
//
//  Created by Bohdan Pokhidnia on 10.06.2024.
//

import SwiftUI
import MapKit

struct DiscoveryMapView: View {
    let countries: [Country]
    
    var body: some View {
        Map(
            initialPosition: MapCameraPosition.camera(
                MapCamera(
                    centerCoordinate: .init(latitude: 0, longitude: 0),
                    distance: 29_000_000
                )
            ),
            interactionModes: [.pan]
        ) {
            ForEach(countries) { (country) in
                Annotation(country.name, coordinate: country.locationCoordinate) {
                    CountryMarkView(
                        countryEmoji: country.emoji,
                        isCheckmarkVisible: country.isVisited
                    )
                }
            }
        }
        .mapStyle(.imagery(elevation: .realistic))
    }
}

#Preview {
    DiscoveryMapView(
        countries: Country.mockData
    )
}
