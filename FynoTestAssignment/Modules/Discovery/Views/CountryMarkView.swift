//
//  CountryMarkView.swift
//  FynoTestAssignment
//
//  Created by Bohdan Pokhidnia on 09.06.2024.
//

import SwiftUI

struct CountryMarkView: View {
    let countryEmoji: CountryEmoji
    let isCheckmarkVisible: Bool
    
    var body: some View {
        ZStack {
            Text(countryEmoji.rawValue)
                .frame(width: 28, height: 28)
                .padding([.top, .leading, .trailing], 3)
                .padding(.bottom, 8.59)
        }
        .background(.white, in: CountryMarkShape())
        .overlay(alignment: .topTrailing) {
            checkmarkView
                .opacity(isCheckmarkVisible ? 1.0 : 0.0)
        }
        .shadow(color: .black.opacity(0.35), radius: 14, y: 4)
        .frame(width: 34, height: 39.59)
    }
    
    private var checkmarkView: some View {
        ZStack {
            Circle()
                .fill(.denimDarkBlue)
            
            Image(.countryMarkCheckmark)
                .frame(width: 14, height: 14)
        }
        .overlay {
            Circle()
                .stroke(style: StrokeStyle(lineWidth: 1))
                .fill(.white)
        }
        .frame(width: 14, height: 14)
        .offset(x: 2, y: -2)
    }
}

#Preview {
    HStack(spacing: 48) {
        CountryMarkView(
            countryEmoji: .ukraine,
            isCheckmarkVisible: false
        )
        
        CountryMarkView(
            countryEmoji: .poland,
            isCheckmarkVisible: true
        )
    }
}
