//
//  UserReviewModels.swift
//  MovieApp
//
//  Created by ILHAM on 13/03/20.
//  Copyright (c) 2020 ILHAM. All rights reserved.
//
///  Modify By:  * Ilham Malik Ibrahim
//              * ilhammalik19@gmail.com
//              * https://github.com/ilhammalik11
//

import UIKit

enum UserReview
{
  // MARK: Use cases
  
  enum Model
  {
    struct Request {
         var id : Int
         var page : Int
    }
    struct Response : Codable
    {
        var data: UserReview.Model.Fetch.Data
    }
    
    struct ViewModel
    {
        var data: UserReview.Model.Fetch.Data
    }

    enum Fetch {
       // MARK: - Welcome
        struct Data: Codable {
            let id, page: Int?
            let results: [Result]?
            let totalPages, totalResults: Int?

            enum CodingKeys: String, CodingKey {
                case id, page, results
                case totalPages = "total_pages"
                case totalResults = "total_results"
            }
        }

        // MARK: - Result
        struct Result: Codable {
            let author, content, id: String?
            let url: String?
        }

    }
  }
}
