//
//  UserReviewWorker.swift
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
import Alamofire

class UserReviewWorker
{
    var headers: HTTPHeaders = [:]
    var params: Parameters = [:]
    var interactor = UserReviewInteractor()
    
    func fetch(request: UserReview.Model.Request, completionHandler: @escaping(UserReview.Model.Fetch.Data?) -> Void) {
        if Connectivity.isConnectedToInternet() {
    
            AF.request(IPListMoviewReview+"/\(request.id)/reviews?api_key=\(ClientID)&page=\(request.page)", method: .get,  encoding: JSONEncoding.default, headers: headers).responseJSON { response in
               
                if response.response?.statusCode == 200 {
                    let json = try? JSONDecoder().decode(UserReview.Model.Fetch.Data.self, from: response.data!)
                    completionHandler(json)
                   // UIViewController.setAlert(title: NSLocalizedString("Success", comment: ""), message:"", style: .success)
                }
                
                if response.response?.statusCode == 400 || response.response?.statusCode == 422 {
                  //  Toast(text: "Ops something wrong", delay: 0, duration: 1).show()
                }
            }
        }else {
//            NVActivityIndicatorPresenter.sharedInstance.stopAnimating(nil)
//            UIViewController.setAlert(title: NSLocalizedString("Perhatian", comment: ""), message: NSLocalizedString("Tidak ada koneksi internet", comment: ""), style: .danger)
        }
    }

}
