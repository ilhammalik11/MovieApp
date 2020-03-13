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
    struct Request {}
    struct Response : Codable
    {
        var data: UserReview.Model.Fetch.Data
    }
    
    struct ViewModel
    {
        var data: UserReview.Model.Fetch.Data
    }

    enum Fetch {
        struct Data: Codable {
            
        }
    }
  }
}
