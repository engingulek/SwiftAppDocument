//
//  Dog.swift
//  SwiftUIDocumentsNotes
//
//  Created by engin gülek on 31.12.2022.
//

import Foundation


struct Dog:  Identifiable ,Hashable {
    var id = UUID()
    let name  : String
}

let dogs : [Dog] = [Dog(name: "Barley"),Dog(name: "Lucky"),Dog(name: "Daisy"),Dog(name: "Jack")]
