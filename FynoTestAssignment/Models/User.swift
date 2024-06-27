//
//  User.swift
//  FynoTestAssignment
//
//  Created by Bohdan Pokhidnia on 10.06.2024.
//

import Foundation

struct User: Identifiable, Equatable {
    let id = UUID()
    let firstName: String
    let lastName: String
    let description: String
    let visitedCountriesCount: Int
    let visitedWorldPercent: Int
    
    var username: String {
        [firstName, lastName].joined(separator: " ")
    }
}
