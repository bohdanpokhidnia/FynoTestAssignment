//
//  DiscoveryUserPageFeature.swift
//  FynoTestAssignment
//
//  Created by Bohdan Pokhidnia on 10.06.2024.
//

import SwiftUI
import ComposableArchitecture

@Reducer
struct DiscoveryUserPageFeature {
    @ObservableState
    struct State: Equatable {
        let user: User
        let visitedCountries: StoreOf<CountryItemsListFeature>
        let bucketListCountries: StoreOf<CountryItemsListFeature>
    }
    
    enum Action {
        case editDescriptionButtonTapped
    }
    
    var body: some ReducerOf<Self> {
        Reduce { (state, action) in
            switch action {            
            case .editDescriptionButtonTapped:
                return .none
            }
        }
    }
}
