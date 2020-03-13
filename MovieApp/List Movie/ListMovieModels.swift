//
//  ListMovieModels.swift
//  MovieApp
//
//  Created by ILHAM on 12/03/20.
//  Copyright (c) 2020 ILHAM. All rights reserved.
//
///  Modify By:  * Ilham Malik Ibrahim
//              * ilhammalik19@gmail.com
//              * https://github.com/ilhammalik11
//

import UIKit

enum ListMovie
{
  // MARK: Use cases
  
  enum Model
  {
    struct Request {
        var sort : Bool
        var id_genre : Int
        var page : Int 
    }
    struct Response : Codable
    {
        var data: ListMovie.Model.Fetch.Data
    }
    
    struct ViewModel
    {
        var data: ListMovie.Model.Fetch.Data
    }

    enum Fetch {
      struct Data: Codable {
            let page, totalResults, totalPages: Int?
            let results: [Result]?

            enum CodingKeys: String, CodingKey {
                case page
                case totalResults = "total_results"
                case totalPages = "total_pages"
                case results
            }
        }

        // MARK: - Result
        struct Result: Codable {
            let popularity: Double?
            let voteCount: Int?
            let video: Bool?
            let posterPath: String?
            let id: Int?
            let adult: Bool?
            let backdropPath: String?
            let originalLanguage, originalTitle: String?
            let genreIDS: [Int]?
            let title: String?
            let voteAverage: Double?
            let overview: String?
            let releaseDate: String?

            enum CodingKeys: String, CodingKey {
                case popularity
                case voteCount = "vote_count"
                case video
                case posterPath = "poster_path"
                case id, adult
                case backdropPath = "backdrop_path"
                case originalLanguage = "original_language"
                case originalTitle = "original_title"
                case genreIDS = "genre_ids"
                case title
                case voteAverage = "vote_average"
                case overview
               case releaseDate = "release_date"
            }
        }

    }
  }
}
