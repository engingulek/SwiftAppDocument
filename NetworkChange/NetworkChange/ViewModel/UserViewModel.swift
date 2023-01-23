//
//  UserViewModel.swift
//  NetworkChange
//
//  Created by engin gülek on 21.01.2023.
//

import Foundation


class UserListViewModel : ObservableObject {
    @Published var userList = [UserViewModel]()
    private var service : NetworkService
    init(service : NetworkService) {
        self.service = service
    }
    
    func dowloadUsers() async {
        do {
            let users = try await service.dowload(Constants.Urls.userExtension)
            DispatchQueue.main.async {
                self.userList = users.map(UserViewModel.init)
            }
        } catch {
            print(error)
        }
    }
}

struct UserViewModel {
    
    let user : User
    
    var id : Int {
        user.id
    }
    
    var name : String {
        user.name
    }
    
    var username : String {
        user.username
    }
    
    var email: String {
        user.email
    }
    
}
