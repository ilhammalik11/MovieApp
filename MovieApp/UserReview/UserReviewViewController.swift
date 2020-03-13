//
//  UserReviewViewController.swift
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

class UserReviewCell: UITableViewCell {
  //  @IBOutlet open weak var avatar: UIImageView!
}

protocol UserReviewDisplayLogic: class
{
  func displayModel(viewModel: UserReview.Model.ViewModel)
}

class UserReviewViewController: UITableViewController, UserReviewDisplayLogic
{
  var interactor: UserReviewBusinessLogic?
  var router: (NSObjectProtocol & UserReviewRoutingLogic & UserReviewDataPassing)?
  
  // MARK: Setup
  
  private func setup()
  {
    let viewController = self
    let interactor = UserReviewInteractor()
    let presenter = UserReviewPresenter()
    let router = UserReviewRouter()
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
    let request = UserReview.Model.Request()
    interactor?.doModel(request: request)
  }
  
  func displayModel(viewModel: UserReview.Model.ViewModel)
  {
    //nameTextField.text = viewModel.name
  }
    
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { return 0 }
    
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
  {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as!  UserReviewCell
    return cell
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){ }
}
