//
//  ListMovieWorker.swift
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

class ListMovieWorker
{
 
    var params: Parameters = [:]
    var interactor = ListMovieInteractor()

    func fetch(request: ListMovie.Model.Request, completionHandler: @escaping(ListMovie.Model.Fetch.Data?) -> Void) {
        if Connectivity.isConnectedToInternet() {
            let sort = request.sort == false ? "popularity.desc" : "popularity.asc"
            AF.request(IPListMovie+"sort_by=\(sort)&api_key=\(ClientID)&with_genres=\(request.id_genre)&page=\(request.page)", method: .get, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
                if response.response?.statusCode == 200 {
                    let json = try? JSONDecoder().decode(ListMovie.Model.Fetch.Data.self, from: response.data!)
                    completionHandler(json)
                   // Toast(text: "Success", delay: 0, duration: 1).show()
                }
                
                if response.response?.statusCode == 400 || response.response?.statusCode == 422 {
                 //   Toast(text: "Ops something wrong", delay: 0, duration: 1).show()
                }
            }
        }else {
//            NVActivityIndicatorPresenter.sharedInstance.stopAnimating(nil)
//            UIViewController.setAlert(title: NSLocalizedString("Perhatian", comment: ""), message: NSLocalizedString("Tidak ada koneksi internet", comment: ""), style: .danger)
        }
    }

}
