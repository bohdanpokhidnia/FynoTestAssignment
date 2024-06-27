//
//  CountryItemsListView.swift
//  FynoTestAssignment
//
//  Created by Bohdan Pokhidnia on 09.06.2024.
//

import SwiftUI
import ComposableArchitecture

struct CountryItemsListView: View {
    @Bindable var store: StoreOf<CountryItemsListFeature>
    
    var body: some View {
        LazyVStack(spacing: 0) {
            headerView
            
            ForEach(store.displayingCountries) { (country) in
                row(country: country)
                    .id(country.id)
            }
            
            if store.isDisplayingMoreButton {
                Button(store.moreButtonTitle) {
                    store.send(.seeMoreButtonTapped, animation: .easeInOut(duration: 0.4))
                }
                .buttonStyle(SeeMoreButtonStyle(isShowMore: store.isSeeMore))
            }
        }
        .onAppear {
            store.send(.onAppear)
        }
    }
    
    private var headerView: some View {
        HStack(spacing: 10) {
            Text(store.title)
                .foregroundStyle(.labelLightPrimary)
                .font(.boldBody)
            
            Spacer()
            
            Button("Add country"){
                store.send(.addCountryButtonTapped)
            }
            .buttonStyle(AddCountryButtonStyle())
            .padding(.vertical, 8)
        }
    }
    
    func row(country: Country) -> some View {
        HStack(spacing: 8) {
            Text(country.emoji.rawValue)
                .frame(width: 24, height: 24)
            
            Text(country.name)
                .foregroundStyle(.labelLightPrimary)
                .font(.regularBody)
                .padding(.vertical, 12)
            
            Spacer()
        }
        .transition(.opacity)
    }
}

#Preview {
    VStack {
        CountryItemsListView(
            store: Store(
                initialState: CountryItemsListFeature.State(
                    title: "I’ve been to",
                    countries: IdentifiedArray(uniqueElements: Country.mockData),
                    limit: 3
                )
            ) {
                CountryItemsListFeature()
            }
        )
        .transition(.opacity)
        .padding(.horizontal, 24)
        
        Spacer()
    }
}
