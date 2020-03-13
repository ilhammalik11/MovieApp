//
//  UserReviewPresenter.swift
//  MovieApp
//
//  Created by ILHAM on 13/03/20.
//  Copyright (c) 2020 ILHAM. All rights reserved.
//
///  Modify By:  * Ilham Malik Ibrahim
//              * ilhammalik19@gmail.com
//              * https://github.com/ilhammalik11

import UIKit

protocol UserReviewPresentationLogic
{
  func presentModel(response: UserReview.Model.Response)
}

class UserReviewPresenter: UserReviewPresentationLogic
{
  weak var viewController: UserReviewDisplayLogic?
  
  // MARK: Do Model
  
  func presentModel(response: UserReview.Model.Response)
  {
    let viewModel = UserReview.Model.ViewModel(data: response.data)
    viewController?.displayModel(viewModel: viewModel)
  }
}
