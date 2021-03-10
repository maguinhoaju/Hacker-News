//
//  NetworkManager.swift
//  Hacker News
//
//  Created by Carlos Magno de França Veiga on 09/03/21.
//

import Foundation

//Implementação utilizando o design pattern "Observable"
class NetworkManager: ObservableObject {
    //expõe via property wrapper a lista de Posts (Observable)
    @Published var posts = [Post]()
    
    func fetchData() {
        if let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page") {
            print(url)
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let results = try decoder.decode(Results.self, from: safeData)
                            DispatchQueue.main.async {
                                self.posts = results.hits
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
