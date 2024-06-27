//
//  DiscoveryFeature.swift
//  FynoTestAssignment
//
//  Created by Bohdan Pokhidnia on 09.06.2024.
//

import SwiftUI
import ComposableArchitecture

@Reducer
struct DiscoveryFeature {
    @ObservableState
    struct State: Equatable {
        let user = User(
            firstName: "John",
            lastName: "Doe",
            description: "Globe-trotter, fearless adventurer, cultural enthusiast, storyteller",
            visitedCountriesCount: 5,
            visitedWorldPercent: 2
        )
        var countries: IdentifiedArrayOf<Country> = []
        var visitedCountriesState = CountryItemsListFeature.State(
            title: "I’ve been to",
            countries: [],
            limit: 3
        )
        var bucketListCountriesState = CountryItemsListFeature.State(
            title: "My bucket list",
            countries: [],
            limit: 3
        )
    }
    
    enum Action: BindableAction {
        case onAppear
        case backButtonTapped
        case visitedCountries(CountryItemsListFeature.Action)
        case bucketListCountries(CountryItemsListFeature.Action)
        case binding(BindingAction<State>)
    }
    
    @Dependency(\.countryLoader) var countryLoader
    @Dependency(\.dismiss) var dismiss
    
    var body: some ReducerOf<Self> {
        Scope(state: \.visitedCountriesState, action: \.visitedCountries) {
            CountryItemsListFeature()
        }
        
        Scope(state: \.bucketListCountriesState, action: \.bucketListCountries) {
            CountryItemsListFeature()
        }
        
        Reduce { (state, action) in
            switch action {
            case .onAppear:
                state.countries = IdentifiedArray(uniqueElements: countryLoader.fetch())
                let visitedCountries = state.countries.filter({ $0.isVisited })
                let bucketListCountries = state.countries.filter({ !$0.isVisited })
                
                state.visitedCountriesState.countries = visitedCountries
                state.bucketListCountriesState.countries = bucketListCountries
                return .none
                
            case .backButtonTapped:
                return .run { (send) in
                    await dismiss()
                }
                
            case .visitedCountries:
                return .none
                
            case .bucketListCountries:
                return .none
                
            case .binding:
                return .none
            }
        }
    }
}
