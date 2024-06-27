//
//  DiscoveryUserStatisticsView.swift
//  FynoTestAssignment
//
//  Created by Bohdan Pokhidnia on 10.06.2024.
//

import SwiftUI

struct DiscoveryUserStatisticsView: View {
    let name: String
    let value: String
    
    var body: some View {
        VStack(spacing: 0) {
            Text(value)
                .font(.boldTitle2)
                .foregroundStyle(.labelLightPrimary)
            
            Text(name)
                .font(.regularSubHeadline)
                .foregroundStyle(.labelLightSecondary)
        }
    }
}

#Preview {
    DiscoveryUserStatisticsView(
        name: "countries",
        value: "5"
    )
}
