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
import XLPagerTabStrip
import Kingfisher

class ListMovieCell: UICollectionViewCell {
   @IBOutlet  weak var avatar: UIImageView!
   @IBOutlet  weak var imageView: UIImageView!
   @IBOutlet  weak var captionLabel: UILabel!
   @IBOutlet  weak var commentLabel: UILabel!
   @IBOutlet  weak var ActivityIndicator: UIActivityIndicatorView!
   override func awakeFromNib() {
     super.awakeFromNib()
     avatar.layer.cornerRadius = 20
     ActivityIndicator.startAnimating()
         DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
             self.ActivityIndicator.stopAnimating()
             self.ActivityIndicator.isHidden = true
             self.imageView.isHidden = false
         }
     }
}

protocol ListMovieDisplayLogic: class
{
  func displayModel(viewModel: ListMovie.Model.ViewModel)
}

class ListMovieViewController: UICollectionViewController, ListMovieDisplayLogic,IndicatorInfoProvider
{

  var interactor: ListMovieBusinessLogic?
  var router: (NSObjectProtocol & ListMovieRoutingLogic & ListMovieDataPassing)?
  var data = [ListMovie.Model.Fetch.Result]()
  var itemInfo: IndicatorInfo = "View"
  let searchBar = UISearchBar()
  var checkHeight : Bool = false
  var numberPage : Int = 1
  var countPage : Int = 0
  var loadingView: LoadingView?
  var isLoading = false
  var isSort = false
  var id_genre : Int = 28
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
    let interactor = ListMovieInteractor()
    let presenter = ListMoviePresenter()
    let router = ListMovieRouter()
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
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    let image = UIImage(named: "sortUp")
    self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style: UIBarButtonItem.Style.plain, target: self, action:  #selector(sortData))
    
    let loadingReusableNib = UINib(nibName: "LoadingView", bundle: nil)
     collectionView.register(loadingReusableNib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "loadingresuableviewid")
     collectionView?.contentInset = UIEdgeInsets(top: 23, left: 16, bottom: 10, right: 16)
    doModel()
  }
  
  // MARK: Do Model

  @objc func sortData(){
    let image = isSort == true ? UIImage(named: "sortUp") :  UIImage(named: "sortDown")
    self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style: UIBarButtonItem.Style.plain, target: self, action:  #selector(sortData))
      isSort = !isSort
    doModel()
  }
    
  func doModel()
  {
    let request = ListMovie.Model.Request(sort: isSort, id_genre: id_genre,page:numberPage)
    interactor?.doModel(request: request)
  }
  
  func displayModel(viewModel: ListMovie.Model.ViewModel)
  {
    isLoading = false
    collectionView.collectionViewLayout.invalidateLayout()
    DispatchQueue.global().async {
            // fake background loading task
            sleep(2)
        self.data.append(contentsOf: viewModel.data.results!)
        self.numberPage = self.numberPage+1
            DispatchQueue.main.async {
                self.collectionView.reloadData()
                self.isLoading = false
            }
        }
  }
    
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { return data.count }
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
  {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier:  "cell", for: indexPath) as! ListMovieCell

           let urlAvatar = URL(string: IPImage+checkNull(string: data[indexPath.row].posterPath))
           cell.imageView.kf.setImage(with: urlAvatar)
           cell.captionLabel.text = checkNull(string:  data[indexPath.row].title)
           cell.commentLabel.text = "Date : \(checkNull(string:  data[indexPath.row].releaseDate))"
           cell.imageView.layer.cornerRadius = 10
    return cell
  }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        router?.routeToDetail(data: data[indexPath.row])
    }
    
 func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
     return itemInfo
 }
 
    
}
extension ListMovieViewController:  UICollectionViewDelegateFlowLayout {
    
    
      func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
          let collectionWidth = collectionView.bounds.width

          return CGSize(width: collectionWidth/2-20, height: 300)
      }
      
      func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
          return 5
      }
      func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
          return 5
      }
  
    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == data.count - 10 && self.isLoading == false{
         loadMoreData()
        }
    }

    func loadMoreData() {
        if !self.isLoading {
            self.isLoading = true
            DispatchQueue.global().async {
                // fake background loading task
                sleep(2)
                self.doModel()
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                    self.isLoading = false
                }
            }
        }
    }

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        if self.isLoading {
            return CGSize.zero
        }else {
            return CGSize(width: collectionView.bounds.size.width, height: 55)
        }
    }

    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionFooter {
            let aFooterView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "loadingresuableviewid", for: indexPath) as! LoadingView
            loadingView = aFooterView
            loadingView?.backgroundColor = UIColor.clear
            return aFooterView
        }
            return UICollectionReusableView()
    }

    override func collectionView(_ collectionView: UICollectionView, willDisplaySupplementaryView view: UICollectionReusableView, forElementKind elementKind: String, at indexPath: IndexPath) {
        if elementKind == UICollectionView.elementKindSectionFooter {
            self.loadingView?.activityIndicator.startAnimating()
            self.loadingView?.activityIndicator.color = UIColor.red
        }
    }

    override func collectionView(_ collectionView: UICollectionView, didEndDisplayingSupplementaryView view: UICollectionReusableView, forElementOfKind elementKind: String, at indexPath: IndexPath) {
      if elementKind == UICollectionView.elementKindSectionFooter {
            self.loadingView?.activityIndicator.stopAnimating()
       }
    }

}


