//
//  DetailMovieViewController.swift
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

protocol DetailMovieDisplayLogic: class
{
  func displayModel(viewModel: DetailMovie.Model.ViewModel)
}

class DetailMovieViewController: UITableViewController, DetailMovieDisplayLogic
{
  var interactor: DetailMovieBusinessLogic?
  var router: (NSObjectProtocol & DetailMovieRoutingLogic & DetailMovieDataPassing)?
  
  // MARK: Setup
  
  private func setup()
  {
    let viewController = self
    let interactor = DetailMovieInteractor()
    let presenter = DetailMoviePresenter()
    let router = DetailMovieRouter()
    viewController.interactor = interactor
    viewController.viewController = viewController
    viewController.router = router
    interactor.presenter = presenter
    presenter.viewController = viewController
    router.viewController = viewController
    router.dataStore = interactor
  }
  
  // MARK: Routing

  
  // MARK: View lifecycle
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    doModel()
    setup()
  }
  
  // MARK: Do Model
  
  //@IBOutlet weak var nameTextField: UITextField!
  
  func doModel()
  {
    let request = DetailMovie.Model.Request()
    interactor?.doModel(request: request)
  }
  
  func displayModel(viewModel: DetailMovie.Model.ViewModel)
  {
    //nameTextField.text = viewModel.name
  }
}
