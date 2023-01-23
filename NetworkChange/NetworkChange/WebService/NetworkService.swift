//
//  NetworkService.swift
//  NetworkChange
//
//  Created by engin gülek on 21.01.2023.
//

import Foundation

protocol NetworkService {
    func dowload(_ resource : String) async throws -> [User]
}
