//
//  DiscoveryFeature.swift
//  FynoTestAssignment
//
//  Created by Bohdan Pokhidnia on 09.06.2024.
//

import MapKit
import ComposableArchitecture

@Reducer
struct DiscoveryFeature {
    @ObservableState
    struct State: Equatable {
        let countries: IdentifiedArrayOf<Country> = [
            Country(
                name: "Ukraine",
                emoji: .ukraine,
                coordinate: CLLocationCoordinate2D(latitude: 48.3794, longitude: 31.1656),
                isVisited: true
            ),
            Country(
                name: "Mexico",
                emoji: .mexico,
                coordinate: CLLocationCoordinate2D(latitude: 23.6345, longitude: -102.5528),
                isVisited: true
            ),
            Country(
                name: "Chile",
                emoji: .chile,
                coordinate: CLLocationCoordinate2D(latitude: -35.6751, longitude: -71.5430),
                isVisited: true
            ),
            Country(
                name: "Iceland",
                emoji: .iceland,
                coordinate: CLLocationCoordinate2D(latitude: 64.9631, longitude: -19.0208),
                isVisited: true
            ),
            Country(
                name: "Dominican Republic",
                emoji: .dominicanRepublic,
                coordinate: CLLocationCoordinate2D(latitude: 18.7357, longitude: -70.1627),
                isVisited: true
            ),
            Country(
                name: "Italy",
                emoji: .italy,
                coordinate: CLLocationCoordinate2D(latitude: 41.8719, longitude: 12.5674),
                isVisited: false
            ),
            Country(
                name: "Peru",
                emoji: .peru,
                coordinate: CLLocationCoordinate2D(latitude: -9.19, longitude: -75.0152),
                isVisited: false
            ),
            Country(
                name: "United States of America",
                emoji: .unitedStates,
                coordinate: CLLocationCoordinate2D(latitude: 37.0902, longitude: -95.7129),
                isVisited: false
            ),
            Country(
                name: "Japan",
                emoji: .japan,
                coordinate: CLLocationCoordinate2D(latitude: 36.2048, longitude: 138.2529),
                isVisited: false
            ),
            Country(
                name: "Poland",
                emoji: .poland,
                coordinate: CLLocationCoordinate2D(latitude: 51.9194, longitude: 19.1451),
                isVisited: false
            ),
            Country(
                name: "Czechia",
                emoji: .сzechia,
                coordinate: CLLocationCoordinate2D(latitude: 49.8175, longitude: 15.4730),
                isVisited: false
            ),
            Country(
                name: "United Arab Emirates",
                emoji: .unitedArabEmirates,
                coordinate: CLLocationCoordinate2D(latitude: 23.4241, longitude: 53.8478),
                isVisited: false
            ),
            Country(
                name: "France",
                emoji: .france,
                coordinate: CLLocationCoordinate2D(latitude: 46.6034, longitude: 1.8883),
                isVisited: false
            ),
        ]
        var visitedCountries: IdentifiedArrayOf<Country> = []
        var visitedCountriesCount: Int = 0
        var visitedWorldPercent: Int = 0
        var bucketListCountries: IdentifiedArrayOf<Country> = []
    }
    
    enum Action {
        case onAppear
        case backButtonTapped
    }
    
    @Dependency(\.dismiss) var dismiss
    
    var body: some ReducerOf<Self> {
        Reduce { (state, action) in
            switch action {
            case .onAppear:
                let visitedCountries = state.countries.elements.filter({ $0.isVisited })
                state.visitedCountries = IdentifiedArrayOf(uniqueElements: visitedCountries)
                state.visitedCountriesCount = visitedCountries.count
                state.visitedWorldPercent = Int(Double(visitedCountries.count) / 250 * 100)
                state.bucketListCountries = state.countries.filter({ !$0.isVisited })
                return .none
                
            case .backButtonTapped:
                return .run { (send) in
                    await dismiss()
                }
            }
        }
    }
}
