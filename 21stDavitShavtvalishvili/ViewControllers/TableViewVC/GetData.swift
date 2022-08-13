//
//  GetData.swift
//  21stDavitShavtvalishvili
//
//  Created by a on 11.08.22.
//

import Foundation

struct MoviesPage: Codable {
    struct Movie: Codable {
        let backdrop_path: String
        let first_air_date: String
        let genre_ids: [Int]
        let id: Int
        let name: String
        let origin_country: String
        let original_language: String
        let original_name: String
        let overview: String
        let popularity: Double
        let poster_path: String
        let vote_average: Double
        let vote_count: Int
    }
    let page: Int
    var results: [Movie]
}

extension TableVC {
    func getCountries<T: Codable>(urlString: String, codableStruct: T) {
        if let url = URL(string: urlString) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    let jsonDecoder = JSONDecoder()
                    do {
                        let parsedJSON = try jsonDecoder.decode(MoviesPage.self, from: data)
                        self.moviesPage = parsedJSON
                        self.moviesPageFiltered = parsedJSON
                    } catch {
                        print(error)
                    }
                }
            }.resume()
        }
    }
}
