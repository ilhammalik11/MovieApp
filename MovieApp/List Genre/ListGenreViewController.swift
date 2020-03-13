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
import XLPagerTabStrip
import Alamofire


class ListGenreCell: UITableViewCell {
  //  @IBOutlet open weak var avatar: UIImageView!
}

protocol ListGenreDisplayLogic: class
{
  func displayModel(viewModel: ListGenre.Model.ViewModel)
}

class ListGenreViewController: ButtonBarPagerTabStripViewController, ListGenreDisplayLogic
{
  var interactor: ListGenreBusinessLogic?
  var router: (NSObjectProtocol & ListGenreRoutingLogic & ListGenreDataPassing)?
  var data = [ListGenre.Model.Fetch.Genre]()
  var isSort = false
  // MARK: Setup
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
     {
       super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
       setup()
     }
     
   required init?(coder aDecoder: NSCoder)
     {
       super.init(coder: aDecoder)
       setup()
     }
     
  private func setup()
  {
    let viewController = self
    let interactor = ListGenreInteractor()
    let presenter = ListGenrePresenter()
    let router = ListGenreRouter()
    viewController.interactor = interactor
    interactor.viewController = viewController
    viewController.router = router
    interactor.presenter = presenter
    presenter.viewController = viewController
    router.viewController = viewController
    router.dataStore = interactor
  }
  
  // MARK: Routing

  
  // MARK: View lifecycle
  let blueInstagramColor = UIColor(red: 37/255.0, green: 111/255.0, blue: 206/255.0, alpha: 1.0)
  var viewControllersList = [UIViewController]()
  override func viewDidLoad()
  {
    settings.style.buttonBarBackgroundColor = .white
           settings.style.buttonBarItemBackgroundColor = .white
           settings.style.selectedBarBackgroundColor = blueInstagramColor
           settings.style.buttonBarItemFont = .boldSystemFont(ofSize: 14)
           settings.style.selectedBarHeight = 2.0
           settings.style.buttonBarMinimumLineSpacing = 0
           settings.style.buttonBarItemTitleColor = .black
           settings.style.buttonBarItemsShouldFillAvailableWidth = true
           settings.style.buttonBarLeftContentInset = 0
           settings.style.buttonBarRightContentInset = 0

           changeCurrentIndexProgressive = { [weak self] (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
               guard changeCurrentIndex == true else { return }
               oldCell?.label.textColor = .black
               newCell?.label.textColor = self?.blueInstagramColor
           }
    super.viewDidLoad()
    self.navigationItem.title = "Movie App"
    self.navigationController?.navigationBar.prefersLargeTitles = true
  
  }

 override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
         let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
         for sub in data {
            let viewController = storyBoard.instantiateViewController(withIdentifier: "ListMovieViewController") as! ListMovieViewController
             viewController.id_genre = sub.id!
             viewController.itemInfo.title = sub.name
             viewController.isSort = isSort
             viewControllersList.append(viewController)
          }
        return viewControllersList
    
    
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

  }

}
