//
//  DiscoveryUserPageView.swift
//  FynoTestAssignment
//
//  Created by Bohdan Pokhidnia on 10.06.2024.
//

import SwiftUI
import ComposableArchitecture

struct DiscoveryUserPageView: View {
    @Bindable var store: StoreOf<DiscoveryUserPageFeature>
    
    var scrollViewProxy: ScrollViewProxy? = nil
    
    var body: some View {
        VStack(spacing: 0) {
            userProfileView
                .padding(.bottom, 5)
            
            userStatisticsView
                .padding(.vertical, 16)
                .padding(.horizontal, 24)
            
            horizontalDividerView
                .padding(.vertical, 8)
                .padding(.horizontal, 24)
            
            CountryItemsListView(store: store.visitedCountries)
                .padding(.horizontal, 24)
            
            horizontalDividerView
                .padding(.vertical, 8)
                .padding(.horizontal, 24)
            
            CountryItemsListView(store: store.bucketListCountries)
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
                Text(store.user.username)
                    .font(.boldBody)
                    .foregroundStyle(.labelLightPrimary)
                
                Button {
                    store.send(.editDescriptionButtonTapped)
                } label: {
                    Image(.pencil)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                }
            }
            .padding(.top, 4)
            
            Text(store.user.description)
                .font(.regularFootnote)
                .lineLimit(2)
                .minimumScaleFactor(0.5)
                .foregroundStyle(.labelLightSecondary)
                .padding(.bottom, 4)
        }
    }
    
    private var userStatisticsView: some View {
        HStack(spacing: 0) {
            DiscoveryUserStatisticsView(
                name: "countries",
                value: store.user.visitedCountriesCount.description
            )
            .frame(maxWidth: .infinity)
            
            Rectangle()
                .fill(.divider)
                .frame(width: 0.5, height: 33)
                .padding(8)
            
            DiscoveryUserStatisticsView(
                name: "world",
                value: "\(store.user.visitedWorldPercent.description)%"
            )
            .frame(maxWidth: .infinity)
        }
    }
    
    private var horizontalDividerView: some View {
        Rectangle()
            .fill(.divider)
            .frame(height: 0.5)
    }
}
