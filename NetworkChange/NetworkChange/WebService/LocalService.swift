//
//  LocalService.swift
//  NetworkChange
//
//  Created by engin gülek on 21.01.2023.
//

import Foundation

class LocalService : NetworkService {
    func dowload(_ resource : String) async throws -> [User] {
        guard let path = Bundle.main.path(forResource: resource, ofType: "json") else {
            fatalError("Error")
        }
        let data = try Data(contentsOf: URL(filePath: path))
        return try JSONDecoder().decode([User].self, from: data)
    }
        
}
