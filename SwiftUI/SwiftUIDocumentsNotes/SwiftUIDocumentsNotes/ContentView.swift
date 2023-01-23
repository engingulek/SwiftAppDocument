//
//  ContentView.swift
//  SwiftUIDocumentsNotes
//
//  Created by engin gülek on 31.12.2022.
//

import SwiftUI

struct ContentView: View {
    @State var firstCirclePercantage : Double = 0
    
    var body: some View {
        

            /*ZStack {
                Circular(lineWidth: 40, backgoroundColor: Color.blue.opacity(0.2), foregroundColor: Color.blue, percentage: firstCirclePercantage)
                    .onTapGesture {
                        if self.firstCirclePercantage == 0 {
                            self.firstCirclePercantage = 50
                        }else {
                            self.firstCirclePercantage  = 0
                        }
                    }
            }.padding(.horizontal)*/
            
         
        
     
       

        
        // MARK: - NavigationStack
       NavigationStack {
            List {
                Section("Dogs") {
                    ForEach(dogs) { dog in
                        NavigationLink(dog.name,value: dog)

                    }
                }
                
                Section("Cats") {
                    ForEach(cats) { cat in
                        NavigationLink(cat.name,value: cat)

                    }
                }
            }.navigationDestination(for: Dog.self) { dog in
                Text(dog.name)
            }
            .navigationDestination(for: Cat.self) { cat in
                Text(cat.name)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
