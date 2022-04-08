//
//  NetworkManager.swift
//  HAX0R News
//
//  Created by Amged on 4/9/22.
//

import Foundation



class NetworkManager: ObservableObject {
   @Published var posts = [Post]()
    
    func fetchData(){
      let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page")!
        
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) {(data, response, error) in
            guard let data = data else { return }

            let deceoder = JSONDecoder()
            do {
                let results =  try deceoder.decode(Results.self, from: data)
                DispatchQueue.main.async {
                    self.posts = results.hits
                }
            } catch  {
                print(error)
            }
            
        }
        
        task.resume()
        
        
    }
}
