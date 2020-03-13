//
//  ListGenrePresenter.swift
//  MovieApp
//
//  Created by ILHAM on 12/03/20.
//  Copyright (c) 2020 ILHAM. All rights reserved.
//
///  Modify By:  * Ilham Malik Ibrahim
//              * ilhammalik19@gmail.com
//              * https://github.com/ilhammalik11

import UIKit

protocol ListGenrePresentationLogic
{
  func presentModel(response: ListGenre.Model.Response)
}

class ListGenrePresenter: ListGenrePresentationLogic
{
  weak var viewController: ListGenreDisplayLogic?
  
  // MARK: Do Model
  
  func presentModel(response: ListGenre.Model.Response)
  {
    let viewModel = ListGenre.Model.ViewModel(data: response.data)
    viewController?.displayModel(viewModel: viewModel)
  }
}
