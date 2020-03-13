//
//  OverViewModels.swift
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

enum OverView
{
  // MARK: Use cases
  
  enum Model
  {
    struct Request {
        var id : Int
    }
    struct Response : Codable
    {
        var data: OverView.Model.Fetch.Data
    }
    
    struct ViewModel
    {
        var data: OverView.Model.Fetch.Data
    }

    enum Fetch {
       struct Data: Codable {
            let id: Int?
            let results: [Result]?
        }

        // MARK: - Result
        struct Result: Codable {
            let id, iso639_1, iso3166_1, key: String?
            let name, site: String?
            let size: Int?
            let type: String?

            enum CodingKeys: String, CodingKey {
                case id
                case iso639_1 = "iso_639_1"
                case iso3166_1 = "iso_3166_1"
                case key, name, site, size, type
            }
        }

    }
  }
}
