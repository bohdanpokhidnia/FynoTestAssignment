//
//  CountryItemsListView.swift
//  FynoTestAssignment
//
//  Created by Bohdan Pokhidnia on 09.06.2024.
//

import SwiftUI

struct CountryItemsListView: View {
    let title: String
    let countries: [Country]
    let limit: Int
    var scrollViewProxy: ScrollViewProxy? = nil
    var onTapAddCountry: () -> Void
    
    private let headerViewId = UUID()
    private let seeMoreButtonId = UUID()
    @State private var isSeeMore: Bool = false
    
    var body: some View {
        LazyVStack(spacing: 0) {
            headerView
                .id(headerViewId)
            
            ForEach(isSeeMore ? countries : Array(countries.prefix(limit))) { (country) in
                row(country: country)
                    .id(country.id)
            }
            
            if limit < countries.count {
                Button(isSeeMore ? "Hide more" : "See \(countries.count - limit) more") {
                    withAnimation(.easeInOut(duration: 0.4)) {
                        isSeeMore.toggle()
                        
                        if !isSeeMore {
                            scrollViewProxy?.scrollTo(headerViewId, anchor: .top)
                        }
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                        if isSeeMore {
                            withAnimation(.easeInOut(duration: 0.4)) {
                                scrollViewProxy?.scrollTo(seeMoreButtonId, anchor: .bottom)
                            }
                        }
                    }
                }
                .buttonStyle(SeeMoreButtonStyle(isShowMore: isSeeMore))
                .id(seeMoreButtonId)
            }
        }
    }
    
    private var headerView: some View {
        HStack(spacing: 10) {
            Text(title)
                .foregroundStyle(.labelLightPrimary)
                .font(.boldBody)
            
            Spacer()
            
            Button("Add country"){
                onTapAddCountry()
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
            title: " I’ve been to",
            countries:  [
                Country(
                    name: "Ukraine",
                    emoji: .ukraine,
                    coordinate: .init(latitude: 0, longitude: 0),
                    isVisited: false
                ),
                Country(
                    name: "Mexico",
                    emoji: .mexico,
                    coordinate: .init(latitude: 0, longitude: 0),
                    isVisited: false
                ),
                Country(
                    name: "Chile",
                    emoji: .chile,
                    coordinate: .init(latitude: 0, longitude: 0),
                    isVisited: false
                ),
                Country(
                    name: "Iceland",
                    emoji: .iceland,
                    coordinate: .init(latitude: 0, longitude: 0),
                    isVisited: false
                ),
                Country(
                    name: "Dominican Republic",
                    emoji: .dominicanRepublic,
                    coordinate: .init(latitude: 0, longitude: 0),
                    isVisited: false
                ),
            ],
            limit: 3,
            onTapAddCountry: {
                
            }
        )
        .padding(.horizontal, 24)
        
        Spacer()
    }
}

#Preview("Country Row", traits: .fixedLayout(width: 390, height: 48)) {
    CountryItemsListView(
        title: "",
        countries: [],
        limit: 0,
        onTapAddCountry: { }
    )
    .row(
        country: Country(
            name: "Ukraine",
            emoji: .ukraine,
            coordinate: .init(latitude: 0, longitude: 0),
            isVisited: false
        )
    )
}
