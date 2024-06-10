//
//  AppView.swift
//  FynoTestAssignment
//
//  Created by Bohdan Pokhidnia on 09.06.2024.
//

import SwiftUI
import ComposableArchitecture

struct AppView: View {
    @Bindable var store: StoreOf<AppFeature>
    
    var body: some View {
        NavigationStack(path: $store.scope(state: \.path, action: \.path)) {
            NavigationLink(
                "Discovery list",
                state: AppFeature.Path.State.discoveryList(DiscoveryFeature.State())
            )
            .buttonStyle(AddCountryButtonStyle(withIcon: false))
        } destination: { (store) in
            switch store.case {
            case let .discoveryList(store):
                DiscoveryView(store: store)
            }
        }
    }
}

#Preview {
    NavigationStack {
        AppView(
            store: Store(
                initialState: AppFeature.State()
            ) {
                AppFeature()
            }
        )
    }
}
