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
import XLPagerTabStrip
import SafariServices

protocol OverViewDisplayLogic: class
{
  func displayModel(viewModel: OverView.Model.ViewModel)
}

class OverViewViewController: UITableViewController, OverViewDisplayLogic,IndicatorInfoProvider
{
  var interactor: OverViewBusinessLogic?
  var router: (NSObjectProtocol & OverViewRoutingLogic & OverViewDataPassing)?
  var itemInfo: IndicatorInfo = "View"
  @IBOutlet weak var overviewDetail: UITextView!
  var data: ListMovie.Model.Fetch.Result!
  var movies = [OverView.Model.Fetch.Result]()
  @IBOutlet weak var trailersCollection: UICollectionView!
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
    let interactor = OverViewInteractor()
    let presenter = OverViewPresenter()
    let router = OverViewRouter()
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
    trailersCollection.delegate = self
    trailersCollection.dataSource = self
    overviewDetail.text = checkNull(string: data.overview)
    doModel()
  }
  
  // MARK: Do Model
  
  //@IBOutlet weak var nameTextField: UITextField!
  
  func doModel()
  {
    let request = OverView.Model.Request(id: data.id!)
    interactor?.doModel(request: request)
  }
  
  func displayModel(viewModel: OverView.Model.ViewModel)
  {
    self.movies.append(contentsOf: viewModel.data.results!)
    trailersCollection.reloadData()
  }
    
  func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
      return itemInfo
  }
    
 // Opens trailer in Youtube when tapped
    @objc func tapVideo(_ sender: UITapGestureRecognizer){
        let location = sender.location(in: self.trailersCollection)
        let indexPath = self.trailersCollection.indexPathForItem(at: location)
        
        if let index = indexPath {
            let video_one = self.movies[index[1]]
            if let video_key = video_one.key{
                let videoURL = youtubeURL(path: video_key)
                if let videourl = videoURL{

                    let safariVC = SFSafariViewController(url: videourl)
                    present(safariVC, animated: true, completion: nil)
                }
            }
        }
    }
}

extension OverViewViewController: UICollectionViewDataSource,UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return self.movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let trailerCell = collectionView.dequeueReusableCell(withReuseIdentifier: "trailerCell", for: indexPath) as! TrailersCell

            let video_one = self.movies[indexPath.row]
        
            if let video_key = video_one.key {
                let videoThumbURL = youtubeThumb(path: video_key)
                let url = videoThumbURL
                let data = try? Data(contentsOf: url!)
                trailerCell.imageView.image = UIImage(data: data!)
                
                
            } else {
               
            }
            
            trailerCell.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapVideo(_:))))
        
        return trailerCell
        
   }
}
