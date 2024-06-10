//
//  SeeMoreButtonStyle.swift
//  FynoTestAssignment
//
//  Created by Bohdan Pokhidnia on 09.06.2024.
//

import SwiftUI

struct SeeMoreButtonStyle: ButtonStyle {
    var isShowMore: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        HStack(spacing: 8) {
            Image(.chevronDown)
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 24)
                .rotationEffect(Angle(degrees: isShowMore ? 180 : 0))
                .animation(.easeInOut, value: 0.5)
            
            configuration.label
                .font(.regularBody)
                .foregroundStyle(.labelLightSecondary)
            
            Spacer()
        }
        .padding(.vertical, 12)
        .opacity(configuration.isPressed ? 0.5 : 1.0)
    }
}
