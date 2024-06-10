//
//  Font+Extensions.swift
//  FynoTestAssignment
//
//  Created by Bohdan Pokhidnia on 10.06.2024.
//

import SwiftUI

extension Font {
    ///Semibold, 22
    static var boldTitle2 = Font.system(size: 22, weight: .semibold)
    
    ///Semibold, 16
    static var boldBody = Font.system(size: 17, weight: .semibold)
    
    ///Semibold, 15
    static var boldButton = Font.system(size: 15, weight: .semibold)
    
    ///Regular, 17
    static var regularBody = Font.system(size: 17, weight: .regular)
    
    ///Regular, 15
    static var regularSubHeadline = Font.system(size: 15, weight: .regular)
    
    ///Regular, 13
    static var regularFootnote = Font.system(size: 13, weight: .regular)
}
