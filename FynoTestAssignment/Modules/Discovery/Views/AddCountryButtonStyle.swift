//
//  AddCountryButtonStyle.swift
//  FynoTestAssignment
//
//  Created by Bohdan Pokhidnia on 09.06.2024.
//

import SwiftUI

struct AddCountryButtonStyle: ButtonStyle {
    var withIcon: Bool = true
    
    func makeBody(configuration: Configuration) -> some View {
        HStack(spacing: 0) {
            if withIcon {
                Image(.plus)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 32, height: 32)
            }
            
            configuration.label
                .foregroundStyle(.indigoLight)
                .font(.boldButton)
                .frame(height: 32)
        }
        .padding(.leading, withIcon ? 4 : 12)
        .padding(.trailing, 12)
        .background(.backgroundLightSecondary, in: Capsule())
        .opacity(configuration.isPressed ? 0.5 : 1.0)
    }
}

#Preview {
    VStack(spacing: 32) {
        Button("Discovery") {
            
        }
        .buttonStyle(AddCountryButtonStyle(withIcon: false))
        
        Button("Add country") {
            
        }
        .buttonStyle(AddCountryButtonStyle(withIcon: true))
    }
}
