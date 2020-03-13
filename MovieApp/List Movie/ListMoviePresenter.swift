//
//  ListMoviePresenter.swift
//  MovieApp
//
//  Created by ILHAM on 12/03/20.
//  Copyright (c) 2020 ILHAM. All rights reserved.
//
///  Modify By:  * Ilham Malik Ibrahim
//              * ilhammalik19@gmail.com
//              * https://github.com/ilhammalik11

import UIKit

protocol ListMoviePresentationLogic
{
  func presentModel(response: ListMovie.Model.Response)
}

class ListMoviePresenter: ListMoviePresentationLogic
{
  weak var viewController: ListMovieDisplayLogic?
  
  // MARK: Do Model
  
  func presentModel(response: ListMovie.Model.Response)
  {
    let viewModel = ListMovie.Model.ViewModel(data: response.data)
    viewController?.displayModel(viewModel: viewModel)
  }
}
