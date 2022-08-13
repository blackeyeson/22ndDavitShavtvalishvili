//
//  Models.swift
//  21stDavitShavtvalishvili
//
//  Created by a on 13.08.22.
//

import Foundation
import UIKit

struct GuestData: Codable {
    let guest_session_id: String
    let success: Bool
}

struct MoviesPage: Codable {
    struct Movie: Codable {
        let backdrop_path: String?
        let first_air_date: String
        let genre_ids: [Int]
        let id: Int
        let name: String
        let origin_country: [String]
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

struct DetailsData: Codable {
    struct Genres: Codable {
        let id: Int
        let name: String
    }
    struct lastEp: Codable {
        let episode_number: Int
    }
    let last_episode_to_air: lastEp
    let genres: [Genres]
    let homepage: URL
    let overview: String
    let name: String
    let last_air_date: String
    let type: String
    let vote_average: Double
    let vote_count: Int
}
