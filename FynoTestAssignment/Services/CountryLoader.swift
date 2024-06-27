//
//  CountryLoader.swift
//  FynoTestAssignment
//
//  Created by Bohdan Pokhidnia on 10.06.2024.
//

import Foundation
import ComposableArchitecture

struct CountryLoader {
    var fetch: () -> [Country]
}

extension CountryLoader: DependencyKey {
    static var liveValue = CountryLoader(
        fetch: {
            guard let fileURL = Bundle.main.url(forResource: "Countries", withExtension: "json") else {
                print("Failed file url")
                return []
            }
            do {
                let data = try Data(contentsOf: fileURL)
                let decoder = JSONDecoder()
                let elements = try decoder.decode([Country].self, from: data)
                return elements
            } catch {
                print("Failed fetch countries: \(error.localizedDescription)")
                return []
            }
        }
    )
}

extension DependencyValues {
    var countryLoader: CountryLoader {
        get { self[CountryLoader.self] }
        set { self[CountryLoader.self] = newValue }
    }
}
