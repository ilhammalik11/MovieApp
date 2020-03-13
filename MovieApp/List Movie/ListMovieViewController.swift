//
//  ListMovieViewController.swift
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

class ListMovieCell: UICollectionViewCell {
  //  @IBOutlet open weak var avatar: UIImageView!
}

protocol ListMovieDisplayLogic: class
{
  func displayModel(viewModel: ListMovie.Model.ViewModel)
}

class ListMovieViewController: UICollectionViewController, ListMovieDisplayLogic
{
  var interactor: ListMovieBusinessLogic?
  var router: (NSObjectProtocol & ListMovieRoutingLogic & ListMovieDataPassing)?
  
  // MARK: Setup
  
  private func setup()
  {
    let viewController = self
    let interactor = ListMovieInteractor()
    let presenter = ListMoviePresenter()
    let router = ListMovieRouter()
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
    let request = ListMovie.Model.Request()
    interactor?.doModel(request: request)
  }
  
  func displayModel(viewModel: ListMovie.Model.ViewModel)
  {
    //nameTextField.text = viewModel.name
  }
    
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { return 0 }
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
  {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier:  "cell", for: indexPath) as! ListMovieCell
    return cell
  }
    
}
