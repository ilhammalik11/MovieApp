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
import XLPagerTabStrip

class UserReviewHeaderCell: UITableViewCell {
    @IBOutlet open weak var avatar: UIImageView!
    @IBOutlet open weak var nameLabel: UILabel!
}


class UserReviewCell: UITableViewCell {
    @IBOutlet open weak var contentLabel: UILabel!
}

protocol UserReviewDisplayLogic: class
{
  func displayModel(viewModel: UserReview.Model.ViewModel)
}

class UserReviewViewController: UITableViewController, UserReviewDisplayLogic,IndicatorInfoProvider
{
  var interactor: UserReviewBusinessLogic?
  var router: (NSObjectProtocol & UserReviewRoutingLogic & UserReviewDataPassing)?
  var itemInfo: IndicatorInfo = "View"
  var data = [UserReview.Model.Fetch.Result]()
  var id : Int = 0
  var numberPage : Int = 1
  var loadingView: LoadingView?
  var isLoading = false

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
    let interactor = UserReviewInteractor()
    let presenter = UserReviewPresenter()
    let router = UserReviewRouter()
    viewController.interactor = interactor
    interactor.viewController = viewController
    viewController.router = router
    interactor.presenter = presenter
    presenter.viewController = viewController
    router.viewController = viewController
    router.dataStore = interactor
  }
  
  // MARK: Routing

  


  override func viewDidLoad()
  {
    super.viewDidLoad()
  
    doModel()

  }
  
  // MARK: Do Model
  
  //@IBOutlet weak var nameTextField: UITextField!
  
  func doModel()
  {
    let request = UserReview.Model.Request(id: id, page: numberPage)
    interactor?.doModel(request: request)
  }
  
  func displayModel(viewModel: UserReview.Model.ViewModel)
  {
      isLoading = false
      DispatchQueue.global().async {
              // fake background loading task
              sleep(2)
          self.data.append(contentsOf: viewModel.data.results!)
          self.numberPage = self.numberPage+1
              DispatchQueue.main.async {
                  self.tableView.reloadData()
                  self.isLoading = false
              }
          }
  }
 
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.data.count
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableCell(withIdentifier: "header") as!  UserReviewHeaderCell
        header.nameLabel.text = checkNull(string:  data[section].author)
        return header
    }
    
    
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { return 1 }
 
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
  {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as!  UserReviewCell
    cell.contentLabel.text = checkNull(string:  data[indexPath.section].content)
    return cell
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){ }
    
 func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
     return itemInfo
 }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == data.count - 1{
            // we are at last cell load more content
                self.perform(#selector(loadMoreData), with: nil, afterDelay: 1.0)
            }
        }

    @objc func loadMoreData() {
        if !self.isLoading {
            self.isLoading = true
            DispatchQueue.global().async {
                // fake background loading task
                sleep(2)
                self.doModel()
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    self.isLoading = false
                }
            }
        }
    }

   
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
//          if self.isLoading {
//              return CGSize.zero
//          }else {
//              return CGSize(width: collectionView.bounds.size.width, height: 55)
//          }
//      }
//
}
