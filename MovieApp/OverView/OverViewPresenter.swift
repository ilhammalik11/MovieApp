//
//  OverViewPresenter.swift
//  MovieApp
//
//  Created by ILHAM on 13/03/20.
//  Copyright (c) 2020 ILHAM. All rights reserved.
//
///  Modify By:  * Ilham Malik Ibrahim
//              * ilhammalik19@gmail.com
//              * https://github.com/ilhammalik11

import UIKit

protocol OverViewPresentationLogic
{
  func presentModel(response: OverView.Model.Response)
}

class OverViewPresenter: OverViewPresentationLogic
{
  weak var viewController: OverViewDisplayLogic?
  
  // MARK: Do Model
  
  func presentModel(response: OverView.Model.Response)
  {
    let viewModel = OverView.Model.ViewModel(data: response.data)
    viewController?.displayModel(viewModel: viewModel)
  }
}
