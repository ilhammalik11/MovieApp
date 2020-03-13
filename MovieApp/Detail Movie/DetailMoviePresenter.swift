//
//  DetailMoviePresenter.swift
//  MovieApp
//
//  Created by ILHAM on 12/03/20.
//  Copyright (c) 2020 ILHAM. All rights reserved.
//
///  Modify By:  * Ilham Malik Ibrahim
//              * ilhammalik19@gmail.com
//              * https://github.com/ilhammalik11

import UIKit

protocol DetailMoviePresentationLogic
{
  func presentModel(response: DetailMovie.Model.Response)
}

class DetailMoviePresenter: DetailMoviePresentationLogic
{
  weak var viewController: DetailMovieDisplayLogic?
  
  // MARK: Do Model
  
  func presentModel(response: DetailMovie.Model.Response)
  {
    let viewModel = DetailMovie.Model.ViewModel(data: response.data)
    viewController?.displayModel(viewModel: viewModel)
  }
}
