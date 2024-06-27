//
//  CountryItemsListFeature.swift
//  FynoTestAssignment
//
//  Created by Bohdan Pokhidnia on 10.06.2024.
//

import SwiftUI
import ComposableArchitecture

@Reducer
struct CountryItemsListFeature {
    @ObservableState
    struct State: Equatable {
        let title: String
        var countries: IdentifiedArrayOf<Country>
        let limit: Int
        var displayingCountries: IdentifiedArrayOf<Country> = []
        var isDisplayingMoreButton: Bool = true
        var isSeeMore: Bool = false
        var moreButtonTitle: String = ""
    }
    
    enum Action {
        case onAppear
        case addCountryButtonTapped
        case seeMoreButtonTapped
    }
    
    var body: some ReducerOf<Self> {
        Reduce { (state, action) in
            switch action {
            case .onAppear:
                state.displayingCountries = state.isSeeMore ? state.countries : IdentifiedArrayOf(state.countries.prefix(state.limit))
                state.moreButtonTitle = state.isSeeMore ? "Hide more" : "See \(state.countries.count - state.limit) more"
                state.isDisplayingMoreButton = state.countries.count > state.limit
                return .none
                
            case .addCountryButtonTapped:
                return .none
                
            case .seeMoreButtonTapped:
                state.isSeeMore.toggle()
                return .send(.onAppear)
            }
        }
    }
}
