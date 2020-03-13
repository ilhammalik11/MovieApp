//
//  ListGenreViewController.swift
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

class ListGenreCell: UITableViewCell {
  //  @IBOutlet open weak var avatar: UIImageView!
}

protocol ListGenreDisplayLogic: class
{
  func displayModel(viewModel: ListGenre.Model.ViewModel)
}

class ListGenreViewController: UIViewController, ListGenreDisplayLogic
{
  var interactor: ListGenreBusinessLogic?
  var router: (NSObjectProtocol & ListGenreRoutingLogic & ListGenreDataPassing)?
  
  // MARK: Setup
  
  private func setup()
  {
    let viewController = self
    let interactor = ListGenreInteractor()
    let presenter = ListGenrePresenter()
    let router = ListGenreRouter()
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
    let request = ListGenre.Model.Request()
    interactor?.doModel(request: request)
  }
  
  func displayModel(viewModel: ListGenre.Model.ViewModel)
  {
    //nameTextField.text = viewModel.name
  }

}
