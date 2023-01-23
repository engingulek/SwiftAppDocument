//
//  ContentView.swift
//  NetworkChange
//
//  Created by engin gülek on 21.01.2023.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var userListViewModel : UserListViewModel
    
    
    init() {
        self.userListViewModel = UserListViewModel(service: LocalService())
    }
    var body: some View {
        List(userListViewModel.userList,id: \.id) { user in
            VStack {
                Text(user.name)
            }
            
        }.task {
            await userListViewModel.dowloadUsers()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
