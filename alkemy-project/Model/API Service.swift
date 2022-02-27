//
//  API Service.swift
//  alkemy-project
//
//  Created by Mariano Battaglia on 24/02/2022.
//

import Foundation
import Alamofire
import UIKit

class ApiService {
    
    static let sharedInstance = ApiService()
    
    static func getPopularMoviesData(completion: @escaping (Result<MoviesData, Error>) -> Void) {
        let popularMoviesURL = "https://api.themoviedb.org/3/movie/popular?api_key=c9c2b69452fd546badb858aaa73ebeec"
        AF.request(popularMoviesURL, encoding: JSONEncoding.default).responseDecodable(of: MoviesData.self) {
            response in
            switch response.result {
            case let .success(result):
                completion(.success(result))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
