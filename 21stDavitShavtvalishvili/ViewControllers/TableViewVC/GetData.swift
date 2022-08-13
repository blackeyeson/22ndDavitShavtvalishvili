//
//  GetData.swift
//  21stDavitShavtvalishvili
//
//  Created by a on 11.08.22.
//

import Foundation
import UIKit

class NetworkService {
    static var shared = NetworkService()
    
    var session = URLSession()
    
    init() {
        let urlSessionConfiguration = URLSessionConfiguration.default
        let urlSession = URLSession(configuration: urlSessionConfiguration)
        self.session = urlSession
    }
    func getData<T: Codable>(urlString: String, comletion: @escaping (T)->(Void)) {
        let url = URL(string: urlString)!
        
        session.dataTask(with: URLRequest(url: url)) { data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
            }
            
            guard let response = response as? HTTPURLResponse else {
                return
            }
            
            guard (200...299).contains(response.statusCode) else {
                print("wrong response")
                return
            }
            
            guard let data = data else {
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let object = try decoder.decode(T.self, from: data)
                
                DispatchQueue.main.async {
                    comletion(object)
                }
            } catch {
                print("decoding error")
            }
        }.resume()
    }
}

extension DetailsVC {
    func getDetails(id: Int) {
        if let url = URL(string: "https://api.themoviedb.org/3/tv/\(id)?api_key=4d5c910865a5edc352e68d5a59651d23&language=en-US") {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    let jsonDecoder = JSONDecoder()
                    do {
                        let parsedJSON = try jsonDecoder.decode(DetailsData.self, from: data)
                        self.details = parsedJSON
                    } catch {
                        print(error)
                    }
                }
            }.resume()
        }
    }
}
