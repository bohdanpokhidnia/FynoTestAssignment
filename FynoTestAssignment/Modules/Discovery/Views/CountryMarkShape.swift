//
//  CountryMarkShape.swift
//  FynoTestAssignment
//
//  Created by Bohdan Pokhidnia on 09.06.2024.
//

import SwiftUI

struct CountryMarkShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.04334*width, y: 0.11938*height))
        path.addCurve(to: CGPoint(x: 0, y: 0.425*height), control1: CGPoint(x: 0, y: 0.17949*height), control2: CGPoint(x: 0, y: 0.26133*height))
        path.addCurve(to: CGPoint(x: 0.04334*width, y: 0.73063*height), control1: CGPoint(x: 0, y: 0.58867*height), control2: CGPoint(x: 0, y: 0.67051*height))
        path.addCurve(to: CGPoint(x: 0.14044*width, y: 0.81316*height), control1: CGPoint(x: 0.06759*width, y: 0.76426*height), control2: CGPoint(x: 0.10087*width, y: 0.79254*height))
        path.addCurve(to: CGPoint(x: 0.23061*width, y: 0.84042*height), control1: CGPoint(x: 0.16603*width, y: 0.82649*height), control2: CGPoint(x: 0.19497*width, y: 0.835*height))
        path.addCurve(to: CGPoint(x: 0.38577*width, y: 0.9029*height), control1: CGPoint(x: 0.28835*width, y: 0.84922*height), control2: CGPoint(x: 0.34429*width, y: 0.86765*height))
        path.addLine(to: CGPoint(x: 0.4792*width, y: 0.98232*height))
        path.addCurve(to: CGPoint(x: 0.5208*width, y: 0.98232*height), control1: CGPoint(x: 0.49069*width, y: 0.99208*height), control2: CGPoint(x: 0.50931*width, y: 0.99208*height))
        path.addLine(to: CGPoint(x: 0.61423*width, y: 0.9029*height))
        path.addCurve(to: CGPoint(x: 0.7694*width, y: 0.84042*height), control1: CGPoint(x: 0.65571*width, y: 0.86765*height), control2: CGPoint(x: 0.71165*width, y: 0.84922*height))
        path.addCurve(to: CGPoint(x: 0.85956*width, y: 0.81316*height), control1: CGPoint(x: 0.80503*width, y: 0.835*height), control2: CGPoint(x: 0.83397*width, y: 0.82649*height))
        path.addCurve(to: CGPoint(x: 0.95666*width, y: 0.73063*height), control1: CGPoint(x: 0.89913*width, y: 0.79254*height), control2: CGPoint(x: 0.93241*width, y: 0.76426*height))
        path.addCurve(to: CGPoint(x: width, y: 0.425*height), control1: CGPoint(x: width, y: 0.67051*height), control2: CGPoint(x: width, y: 0.58867*height))
        path.addCurve(to: CGPoint(x: 0.95666*width, y: 0.11938*height), control1: CGPoint(x: width, y: 0.26133*height), control2: CGPoint(x: width, y: 0.17949*height))
        path.addCurve(to: CGPoint(x: 0.85956*width, y: 0.03684*height), control1: CGPoint(x: 0.93241*width, y: 0.08574*height), control2: CGPoint(x: 0.89913*width, y: 0.05745*height))
        path.addCurve(to: CGPoint(x: 0.5*width, y: 0), control1: CGPoint(x: 0.78883*width, y: 0), control2: CGPoint(x: 0.69256*width, y: 0))
        path.addCurve(to: CGPoint(x: 0.14044*width, y: 0.03684*height), control1: CGPoint(x: 0.30744*width, y: 0), control2: CGPoint(x: 0.21117*width, y: 0))
        path.addCurve(to: CGPoint(x: 0.04334*width, y: 0.11938*height), control1: CGPoint(x: 0.10087*width, y: 0.05745*height), control2: CGPoint(x: 0.06759*width, y: 0.08574*height))
        path.closeSubpath()
        return path
    }
}
