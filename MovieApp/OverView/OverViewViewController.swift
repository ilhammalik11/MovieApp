//
//  OverViewViewController.swift
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

protocol OverViewDisplayLogic: class
{
  func displayModel(viewModel: OverView.Model.ViewModel)
}

class OverViewViewController: UITableViewController, OverViewDisplayLogic
{
  var interactor: OverViewBusinessLogic?
  var router: (NSObjectProtocol & OverViewRoutingLogic & OverViewDataPassing)?
  
  // MARK: Setup
  
  private func setup()
  {
    let viewController = self
    let interactor = OverViewInteractor()
    let presenter = OverViewPresenter()
    let router = OverViewRouter()
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
    let request = OverView.Model.Request()
    interactor?.doModel(request: request)
  }
  
  func displayModel(viewModel: OverView.Model.ViewModel)
  {
    //nameTextField.text = viewModel.name
  }
}
