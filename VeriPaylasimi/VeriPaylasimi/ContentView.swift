//
//  ContentView.swift
//  VeriPaylasimi
//
//  Created by engin gülek on 21.01.2023.
//

import SwiftUI

class Veri : ObservableObject {
    @Published var sayac : Int = 0
}


struct ContentView: View {
    @ObservedObject var veri = Veri()
    var body: some View {
        NavigationView {
            VStack {
                Text("Sayaç : \(self.veri.sayac)")
                Button {
                    self.veri.sayac += 1
                } label: {
                    Text("Ekle")
                }

                NavigationLink {
                    IkinciSayfa(gelenSayac: self.$veri.sayac)
                } label: {
                    Text("Gecis Yap")
                }

                Text("Hello World")
            }.navigationTitle("Ana Sayfa")
        }
    }
}


struct IkinciSayfa : View {
    @Binding var gelenSayac : Int
    var body: some View {
        VStack {
            Text("Sayaç : \(self.gelenSayac)")
            Button {
                gelenSayac += 1
            } label: {
                Text("Ekle (İkinci Sayfa)")
            }
            Text("Hello World")
        }.navigationTitle("İkinci Sayfa")
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
