//
//  SplashScreen.swift
//  MovieApp
//
//  Created by ILHAM on 12/03/20.
//  Copyright © 2020 ILHAM. All rights reserved.
//

import UIKit
import Alamofire

class SplasScreen: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        doModel()
    }

    func doModel(){
        AF.request(IPListGenre, method: .get,  encoding: JSONEncoding.default, headers: headers).responseJSON { response in
                 if response.response?.statusCode == 200 {
                     let json = try? JSONDecoder().decode(ListGenre.Model.Fetch.Data.self, from: response.data!)
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                         let destinationVC = storyboard.instantiateViewController(withIdentifier: "ListGenreViewController") as! ListGenreViewController
                    destinationVC.data = (json?.genres)!
                     DispatchQueue.main.async {
                        let navController = UINavigationController(rootViewController: destinationVC)
                        navController.modalPresentationStyle = .fullScreen //or .overFullScreen for transparency
                        self.present(navController, animated:true, completion: nil)
                    }
                    
            }
        }
    }
    // MARK: - PagerTabStripDataSource
}
