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
import XLPagerTabStrip
class TrailersCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
}


protocol DetailMovieDisplayLogic: class
{
  func displayModel(viewModel: DetailMovie.Model.ViewModel)
}

class DetailMovieViewController: ButtonBarPagerTabStripViewController, DetailMovieDisplayLogic
{
  var interactor: DetailMovieBusinessLogic?
  var router: (NSObjectProtocol & DetailMovieRoutingLogic & DetailMovieDataPassing)?
  var data: ListMovie.Model.Fetch.Result!
 
  @IBOutlet weak var backgroundImage: UIImageView!
  @IBOutlet weak var moviePosterImage: UIImageView!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var ratingLabel: UILabel!
  @IBOutlet weak var releaseDate: UILabel!
  @IBOutlet weak var runTime: UILabel!
  @IBOutlet weak var CircularProgress: CircularProgressView!
  @IBOutlet weak var actorsCollection: UICollectionView!
  @IBOutlet weak var trailersCollection: UICollectionView!
    
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
  // MARK: Setup
  
  private func setup()
  {
    let viewController = self
    let interactor = DetailMovieInteractor()
    let presenter = DetailMoviePresenter()
    let router = DetailMovieRouter()
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
    let urlAvatar = URL(string: IPImage+checkNull(string: data.posterPath))
    backgroundImage.kf.setImage(with: urlAvatar)
    titleLabel.text = checkNull(string: data.title)
   
    if let average = data.voteAverage {
               let rating = String(format:"%.1f", average)
               ratingLabel.text = "\(rating)"
    }
    releaseDate.text = ("Release Date: " + checkNull(string: data.releaseDate).convertDateString()!)
    
     self.perform(#selector(animateProgress), with: nil, afterDelay: 0.5)
      
   // doModel()
    imageGradient()
  }
    var gradient: CAGradientLayer!
       
    func imageGradient() {
        gradient = CAGradientLayer()
        gradient.frame = backgroundImage.bounds
        gradient.colors = [UIColor.white.cgColor, UIColor.white.cgColor, UIColor.white.cgColor, UIColor.clear.cgColor]
        gradient.locations = [0, 0.6, 0.8, 1]
        backgroundImage.layer.mask = gradient
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
    
 /// Animation for average score
 @objc func animateProgress() {
     
     let cP = self.view.viewWithTag(101) as! CircularProgressView
     cP.setProgressWithAnimation(duration: 0.7, value: 0.2)
     cP.trackColor = UIColor.white
     
     let average = data.voteAverage!
     let one = 1.0...1.9
     let two = 2.0...2.9
     let three = 3.0...3.9
     let four = 4.0...4.9
     let five = 5.0...5.9
     let six = 6.0...6.9
     let seven = 7.0...7.9
     let eight = 8.0...8.9
     let nine = 9.0...9.9
     let ten = 10.0
     
     if one ~= average {
         cP.setProgressWithAnimation(duration: 0.7, value: 0.1)
         cP.progressColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
     } else if two ~= average {
         cP.setProgressWithAnimation(duration: 0.7, value: 0.2)
         cP.progressColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
     } else if three ~= average {
         cP.setProgressWithAnimation(duration: 0.7, value: 0.3)
         cP.progressColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
     } else if four ~= average {
         cP.setProgressWithAnimation(duration: 0.7, value: 0.4)
         cP.progressColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
     } else if five ~= average {
         cP.setProgressWithAnimation(duration: 0.7, value: 0.5)
         cP.progressColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
     } else if six ~= average {
        cP.setProgressWithAnimation(duration: 0.7, value: 0.6)
         cP.progressColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
     } else if seven ~= average {
         cP.setProgressWithAnimation(duration: 0.7, value: 0.7)
         cP.progressColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
     } else if eight ~= average {
         cP.setProgressWithAnimation(duration: 0.7, value: 0.8)
         cP.progressColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
     } else if nine ~= average {
         cP.setProgressWithAnimation(duration: 0.7, value: 0.9)
         cP.progressColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
     } else if ten ~= average {
         cP.setProgressWithAnimation(duration: 0.7, value: 1.0)
         cP.progressColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
     } else {
         cP.setProgressWithAnimation(duration: 0.7, value: 0.0)
         cP.progressColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
     }
 }
    
 // MARK: Actions
   @IBAction func backButtonTapped(_ sender: Any) {
       self.dismiss(animated: true, completion: nil)
   }
    
  
   
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                let viewController = storyBoard.instantiateViewController(withIdentifier: "OverViewViewController") as! OverViewViewController
                viewController.data = data
                viewController.itemInfo.title = "Description"
                viewControllersList.append(viewController)
            
                let viewController2 = storyBoard.instantiateViewController(withIdentifier: "UserReviewViewController") as! UserReviewViewController
                viewController2.id = data.id!
                viewController2.itemInfo.title = "Review"
                viewControllersList.append(viewController2)
            
                return viewControllersList
       }
}
