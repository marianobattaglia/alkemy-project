//
//  Model.swift
//  alkemy-project
//
//  Created by Mariano Battaglia on 24/02/2022.
//

import Foundation
import Alamofire
import UIKit

struct MoviesData: Decodable {
    
    let movies: [Movie]
    
    private enum CodingKeys: String, CodingKey {
        case movies = "results"
    }
}

struct Movie: Decodable {
    
    let title: String?
    let year: String?
    let rate: Double?
    let posterImage: String?
    let overview: String?
    
    private enum CodingKeys: String, CodingKey {
        case title = "original_title"
        case overview = "overview"
        case year = "release_date"
        case rate = "vote_average"
        case posterImage = "poster_path"
    }
    
}
