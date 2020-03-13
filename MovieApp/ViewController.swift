//
//  ViewController.swift
//  MovieApp
//
//  Created by ILHAM on 12/03/20.
//  Copyright © 2020 ILHAM. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class ViewControllers: ButtonBarPagerTabStripViewController {

    @IBOutlet weak var shadowView: UIView!
    let blueInstagramColor = UIColor(red: 37/255.0, green: 111/255.0, blue: 206/255.0, alpha: 1.0)

    override func viewDidLoad() {
        
        //        AF.request(IPListGenre, method: .get,  encoding: JSONEncoding.default, headers: headers).responseJSON { response in
        //             print(response.value as Any)
        //            if response.response?.statusCode == 200 {
        //                let json = try? JSONDecoder().decode(ListGenre.Model.Fetch.Data.self, from: response.data!)
        //                for sub in (json?.genres)! {
        //                       let viewController = storyBoard.instantiateViewController(withIdentifier: "ListMovieViewController") as! ListMovieViewController
        //                       viewController.itemInfo.title = sub.name
        //                       viewControllers.append(viewController)
        //                    }
        //            }
        //        }

        
        // change selected bar color
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
    }

    // MARK: - PagerTabStripDataSource

    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let child_1 = storyBoard.instantiateViewController(withIdentifier: "ListMovieViewController") as! ListMovieViewController
        let child_2 = storyBoard.instantiateViewController(withIdentifier: "ListMovieViewController") as! ListMovieViewController
        
        return [child_1, child_2]
    }

    // MARK: - Custom Action

    @IBAction func closeAction(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
