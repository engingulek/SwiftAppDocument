//
//  ContentView.swift
//  JokesAppSwiftUIMVVM
//
//  Created by engin gülek on 21.01.2023.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject  var jokeVM = JokesViewModel()
    var body: some View {
        NavigationView {
            List(jokeVM.jokes) { element in
                Text(element.joke)
                
            }
        }.onAppear{
            jokeVM.getJokes()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
