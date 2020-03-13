//
//  ListGenreWorker.swift
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

class ListGenreWorker
{
    var headers: HTTPHeaders = [:]
    var params: Parameters = [:]
    var interactor = ListGenreInteractor()
    func fetch(request: ListGenre.Model.Request, completionHandler: @escaping(ListGenre.Model.Fetch.Data?) -> Void) {
        if Connectivity.isConnectedToInternet() {
            
        }else {
//            NVActivityIndicatorPresenter.sharedInstance.stopAnimating(nil)
//            UIViewController.setAlert(title: NSLocalizedString("Perhatian", comment: ""), message: NSLocalizedString("Tidak ada koneksi internet", comment: ""), style: .danger)
        }
    }

}
