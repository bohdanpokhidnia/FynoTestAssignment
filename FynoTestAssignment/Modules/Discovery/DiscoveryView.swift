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
        ScrollViewReader { (proxy) in
            ScrollView {
                VStack(spacing: 0) {
                    mapView
                        .frame(height: 414)
                    
                    userPageView(proxy: proxy)
                        .offset(y: -24)
                        .padding(.bottom, -24)
                }
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
    
    private var mapView: some View {
        Map(
            initialPosition: MapCameraPosition.camera(
                MapCamera(
                    centerCoordinate: .init(latitude: 0, longitude: 0),
                    distance: 29_000_000
                )
            ),
            interactionModes: [.pan]
        ) {
            ForEach(store.countries) { (country) in
                Annotation(country.name, coordinate: country.coordinate) {
                    CountryMarkView(
                        countryEmoji: country.emoji,
                        isCheckmarkVisible: country.isVisited
                    )
                }
            }
        }
        .mapStyle(.imagery(elevation: .realistic))
    }
    
    private func userPageView(proxy: ScrollViewProxy) -> some View {
        VStack(spacing: 0) {
            userProfileView
                .padding(.bottom, 5)
            
            userStatisticsView
                .padding(.vertical, 16)
                .padding(.horizontal, 24)
            
            horizontalDividerView
                .padding(.vertical, 8)
                .padding(.horizontal, 24)
            
            CountryItemsListView(
                title: "I’ve been to",
                countries: store.visitedCountries.elements,
                limit: 3,
                scrollViewProxy: proxy,
                onTapAddCountry: { }
            )
            .padding(.horizontal, 24)
            
            horizontalDividerView
                .padding(.vertical, 8)
                .padding(.horizontal, 24)
            
            CountryItemsListView(
                title: "My bucket list",
                countries: store.bucketListCountries.elements,
                limit: 3,
                scrollViewProxy: proxy,
                onTapAddCountry: { }
            )
            .padding(.horizontal, 24)
            .padding(.bottom, self.safeArea.bottom)
        }
        .background(
            .white,
            in: .rect(topLeadingRadius: 16, topTrailingRadius: 16)
        )
    }
    
    private var userProfileView: some View {
        HStack(alignment: .top, spacing: 21) {
            userAvatar
                .offset(y: -12)
                .padding(.bottom, -12)
                .padding(.leading, 23)
            
            userDescription
                .padding(.top, 12)
            
            Spacer()
        }
    }
    
    private var userAvatar: some View {
        Image(.userAvatar)
            .resizable()
            .scaledToFill()
            .frame(width: 80, height: 80)
            .clipShape(Circle())
            .overlay(
                Circle()
                    .stroke(
                        style: StrokeStyle(lineWidth: 4)
                    )
            )
            .foregroundStyle(.white)
    }
    
    private var userDescription: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(spacing: 4) {
                Text("John Doe")
                    .font(.boldBody)
                    .foregroundStyle(.labelLightPrimary)
                
                Button {
                    
                } label: {
                    Image(.pencil)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                }
            }
            .padding(.top, 4)
            
            Text("Globe-trotter, fearless adventurer, cultural enthusiast, storyteller")
                .font(.regularFootnote)
                .lineLimit(2)
                .minimumScaleFactor(0.5)
                .foregroundStyle(.labelLightSecondary)
                .padding(.bottom, 4)
        }
    }
    
    private var userStatisticsView: some View {
        HStack(spacing: 0) {
            statisticsView(
                value: String(store.visitedCountriesCount),
                name: "countries"
            )
            .frame(maxWidth: .infinity)
            
            Rectangle()
                .fill(.divider)
                .frame(width: 0.5, height: 33)
                .padding(8)
            
            statisticsView(
                value: "\(store.visitedWorldPercent)%",
                name: "world"
            )
            .frame(maxWidth: .infinity)
        }
    }
    
    private func statisticsView(value: String, name: String) -> some View {
        VStack(spacing: 0) {
            Text(value)
                .font(.boldTitle2)
                .foregroundStyle(.labelLightPrimary)
            
            Text(name)
                .font(.regularSubHeadline)
                .foregroundStyle(.labelLightSecondary)
        }
    }
    
    private var horizontalDividerView: some View {
        Rectangle()
            .fill(.divider)
            .frame(height: 0.5)
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
