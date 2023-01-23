//
//  Cat.swift
//  SwiftUIDocumentsNotes
//
//  Created by engin gülek on 31.12.2022.
//

import Foundation
struct Cat:  Identifiable ,Hashable {
    var id = UUID()
    let name  : String
}

let cats : [Cat] = [Cat(name: "Bo"),Cat(name: "Ba"),Cat(name: "Whiskas")]
