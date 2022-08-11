//
//  GetData.swift
//  21stDavitShavtvalishvili
//
//  Created by a on 11.08.22.
//

import Foundation

// MARK: - WelcomeElement
struct Country: Decodable {
    let name: String
    let topLevelDomain: [String]
    let alpha2Code, alpha3Code: String
    let callingCodes: [String]
    let capital: String?
    let altSpellings: [String]?
    let subregion: String
    let region: String
    let population: Int
    let latlng: [Double]?
    let demonym: String
    let area: Double?
    let timezones: [String]
    let borders: [String]?
    let nativeName, numericCode: String
    let flags: Flags
    let currencies: [Currency]?
    let flag: URL
    let independent: Bool
}

// MARK: - Currency
struct Currency: Decodable {
    let code, name, symbol: String
}

// MARK: - Flags
struct Flags: Decodable {
    let svg: URL
    let png: URL
}

extension TableVC {
    func getCountries() {
        if let url = URL(string: "https://restcountries.com/v2/all") {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    let jsonDecoder = JSONDecoder()
                    do {
                        let parsedJSON = try jsonDecoder.decode([Country].self, from: data)
                        self.countries = parsedJSON
                        self.countriesFiltered = parsedJSON
                    } catch {
                        print(error)
                    }
                }
            }.resume()
        }
    }
}
