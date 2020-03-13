//
//  ListGenreModels.swift
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

enum ListGenre
{
  // MARK: Use cases
  
  enum Model
  {
    struct Request {}
    struct Response : Codable
    {
        var data: ListGenre.Model.Fetch.Data
    }
    
    struct ViewModel
    {
        var data: ListGenre.Model.Fetch.Data
    }

    enum Fetch {
       struct Data: Codable {
            let genres: [Genre]?
        }

        // MARK: - Genre
        struct Genre: Codable {
            let id: Int?
            let name: String?
        }

    }
  }
}
