//
//  DetailMovieWorker.swift
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
import Alamofire

class DetailMovieWorker
{
    var headers: HTTPHeaders = [:]
    var params: Parameters = [:]
    var interactor = DetailMovieInteractor()
    func fetch(url:String,request: DetailMovie.Model.Request, completionHandler: @escaping(DetailMovie.Model.Fetch.Data?) -> Void) {
        if Connectivity.isConnectedToInternet() {
            Alamofire.request(url, method: .patch, parameters:  self.params, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
                if response.response?.statusCode == 200 {
                    let json = try? JSONDecoder().decode(DetailMovie.Model.Fetch.Data.self, from: response.data!)
                    completionHandler(json)
                    Toast(text: "Success", delay: 0, duration: 1).show()
                }
                
                if response.response?.statusCode == 400 || response.response?.statusCode == 422 {
                    Toast(text: "Ops something wrong", delay: 0, duration: 1).show()
                }
            }
        }else {
            NVActivityIndicatorPresenter.sharedInstance.stopAnimating(nil)
            UIViewController.setAlert(title: NSLocalizedString("Perhatian", comment: ""), message: NSLocalizedString("Tidak ada koneksi internet", comment: ""), style: .danger)
        }
    }

}
