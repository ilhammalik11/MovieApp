//
//  UserReviewInteractor.swift
//  MovieApp
//
//  Created by ILHAM on 13/03/20.
//  Copyright (c) 2020 ILHAM. All rights reserved.
//
///  Modify By:  * Ilham Malik Ibrahim
//              * ilhammalik19@gmail.com
//              * https://github.com/ilhammalik11

import UIKit

protocol UserReviewBusinessLogic
{
  func doModel(request: UserReview.Model.Request)
}

protocol UserReviewDataStore
{
  //var name: String { get set }
    var data: UserReview.Model.Fetch.Data! { get set }
}

class UserReviewInteractor: UserReviewBusinessLogic, UserReviewDataStore
{
  var presenter: UserReviewPresentationLogic?
  var worker: UserReviewWorker?
  var url: String = ""
  var data: UserReview.Model.Fetch.Data!
  var viewController: UserReviewViewController?
  // MARK: Do Model
  
    func doModel(request: UserReview.Model.Request)
  {
    worker = UserReviewWorker()
    worker?.interactor = self
    worker?.fetch(url:url,request: request) { result  in
        if result != nil {
            self.data = result!
            let response = UserReview.Model.Response(data: result!)
            self.presenter?.presentModel(response: response)
        }
    }
  }
}
