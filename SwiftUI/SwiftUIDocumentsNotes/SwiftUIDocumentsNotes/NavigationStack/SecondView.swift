//
//  SecondView.swift
//  SwiftUIDocumentsNotes
//
//  Created by engin gülek on 31.12.2022.
//

import SwiftUI

struct SecondView: View {
    @State var path : [Dog] = []
    var body: some View {
        NavigationStack(path: $path) {
            List(dogs) { dog in
                VStack {
                    Text(dog.name)
                    Button("Go Back") {
                        self.path = []
                        //popoRootViewController
                        // en başa geri dönecek
                    }
                }
                
            }
        }
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView()
    }
}
