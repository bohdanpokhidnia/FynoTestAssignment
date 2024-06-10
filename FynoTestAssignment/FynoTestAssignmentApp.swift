//
//  FynoTestAssignmentApp.swift
//  FynoTestAssignment
//
//  Created by Bohdan Pokhidnia on 09.06.2024.
//

import SwiftUI
import ComposableArchitecture

@main
struct FynoTestAssignmentApp: App {
    static let appFeatureStore = Store(initialState: AppFeature.State()) {
        AppFeature()
    }
    
    var body: some Scene {
        WindowGroup {
            AppView(store: Self.appFeatureStore)
        }
    }
}
