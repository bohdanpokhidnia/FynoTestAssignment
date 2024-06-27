//
//  DiscoveryView.swift
//  FynoTestAssignment
//
//  Created by Bohdan Pokhidnia on 09.06.2024.
//

import SwiftUI
import MapKit
import ComposableArchitecture

struct DiscoveryView: View {
    @Bindable var store: StoreOf<DiscoveryFeature>
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                DiscoveryMapView(countries: store.countries.elements)
                    .frame(height: 414)
                
                DiscoveryUserPageView(
                    store: Store(
                        initialState: DiscoveryUserPageFeature.State(
                            user: store.user,
                            visitedCountries: store.scope(state: \.visitedCountriesState, action: \.visitedCountries),
                            bucketListCountries: store.scope(state: \.bucketListCountriesState, action: \.bucketListCountries)
                        )) {
                            DiscoveryUserPageFeature()
                        }
                )
                .offset(y: -24)
                .padding(.bottom, -24)
            }
            .scrollTargetLayout()
        }
        .scrollIndicators(.hidden)
        .onAppear {
            store.send(.onAppear)
        }
        .ignoresSafeArea(edges: .vertical)
        .background(.black)
        .toolbarBackground(.hidden, for: .navigationBar)
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    store.send(.backButtonTapped)
                } label: {
                    Image(.backButton)
                }
            }
        }
    }
}

#Preview {
    DiscoveryView(
        store: Store(
            initialState: DiscoveryFeature.State()
        ) {
            DiscoveryFeature()
        }
    )
}
