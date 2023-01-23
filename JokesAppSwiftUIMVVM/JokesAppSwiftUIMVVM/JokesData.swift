//
//  JokesData.swift
//  JokesAppSwiftUIMVVM
//
//  Created by engin gülek on 21.01.2023.
//

import Foundation

// MARK: - Welcome
struct Welcome: Identifiable, Codable {
    var id = UUID()
    let type: String
    let value: [Value]
}

// MARK: - Value
struct Value: Identifiable, Codable {
    let id: Int
    let joke: String
    let categories: [String]
}
