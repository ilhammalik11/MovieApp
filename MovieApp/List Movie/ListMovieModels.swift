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
    struct Request {}
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
            
        }
    }
  }
}
