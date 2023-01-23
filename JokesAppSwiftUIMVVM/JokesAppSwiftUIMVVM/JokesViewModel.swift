//
//  JokesViewModel.swift
//  JokesAppSwiftUIMVVM
//
//  Created by engin gülek on 21.01.2023.
//

import Foundation
import Alamofire
class JokesViewModel : ObservableObject {
    // Published ile eğer değişiklik olur ise bu değikliğin dillenmesi sağlanmaktadır.
    @Published var jokes = [Value]()
    
    func getJokes() {
        AF.request("https://raw.githubusercontent.com/atilsamancioglu/JokesAppJsonData/main/chuck.json",method: .get).responseDecodable(of:Welcome.self) { response in
            switch response.result {
            case .success(let data):
                let value = data.value
                self.jokes += value
                print(self.jokes)
            case .failure(let error):
                print(error.localizedDescription)
            }
            
        }
    }
}
